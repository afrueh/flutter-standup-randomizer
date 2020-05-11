import 'package:standup_randomizer/api/Flickr/flickr.dart';
import 'package:standup_randomizer/api/Flickr/flickr_models.dart';

class FlickrService {
  final FlickrApi flickrApi;

  FlickrService({this.flickrApi = const FlickrApi()});

  Future<FlickrPhotoOfTheDay> getImageOfTheDay() async {
    try {
      final interestingPhotos = await flickrApi.getFlickrInterestingList(
        imagesPerPage: 1,
        page: 1,
      );
      var interestingPhoto = interestingPhotos.photos.first;
      final photoInfo = await flickrApi.getFlickrInfo(id: interestingPhoto.id);
      final photoSizes =
          await flickrApi.getFlickrPhotoSizes(id: interestingPhoto.id);

      return FlickrPhotoOfTheDay(
        photoInfo: photoInfo,
        photoSize: photoSizes.largestSize,
      );
    } catch (e) {
      print(e);
      throw e;
    }
  }
}

class FlickrPhotoOfTheDay {
  final FlickrPhotoSize photoSize;
  final FlickrPhotoInfo photoInfo;

  FlickrPhotoOfTheDay({this.photoSize, this.photoInfo});

  String get photoUrl => photoSize.source;
  String get title => photoInfo.title.value;
  String get owner =>
      '${photoInfo.owner.realname} [${photoInfo.owner.username}], ${photoInfo.owner.location}, Flickr';
}
