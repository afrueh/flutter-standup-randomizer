class FlickrImageOwner {
  final String username;
  final String realname;
  final String location;

  FlickrImageOwner({this.username, this.realname, this.location});

  factory FlickrImageOwner.fromJson(Map<String, dynamic> json) {
    return FlickrImageOwner(
      username: json['username'],
      realname: json['realname'],
      location: json['location'],
    );
  }
}

class FlickrImageTitle {
  final String value;

  FlickrImageTitle({this.value});

  factory FlickrImageTitle.fromJson(Map<String, dynamic> json) {
    return FlickrImageTitle(
      value: json['_content'],
    );
  }
}

class FlickrPhotoInfo {
  final String id;
  final FlickrImageTitle title;
  final FlickrImageOwner owner;

  FlickrPhotoInfo({this.id, this.owner, this.title});

  factory FlickrPhotoInfo.fromJson(Map<String, dynamic> json) {
    var photoJson = json['photo'];

    return FlickrPhotoInfo(
      id: photoJson['id'],
      title: FlickrImageTitle.fromJson(
        photoJson['title'],
      ),
      owner: FlickrImageOwner.fromJson(
        photoJson['owner'],
      ),
    );
  }
}

class FlickrPhotos {
  final int page;
  final int pages;
  final int perPage;
  final int total;
  final List<FlickrPhoto> photos;

  FlickrPhotos({
    this.page,
    this.pages,
    this.perPage,
    this.total,
    this.photos,
  });

  factory FlickrPhotos.fromJson(Map<String, dynamic> json) {
    final photosJson = json['photos'];

    return FlickrPhotos(
      page: photosJson['page'],
      pages: photosJson['pages'],
      perPage: photosJson['perPage'],
      total: photosJson['total'],
      photos: FlickrPhoto.fromJsonList(photosJson['photo']),
    );
  }
}

class FlickrPhoto {
  final String id;

  FlickrPhoto({
    this.id,
  });

  factory FlickrPhoto.fromJson(Map<String, dynamic> json) {
    return FlickrPhoto(id: json['id']);
  }

  static List<FlickrPhoto> fromJsonList(dynamic json) {
    List<dynamic> rawList = List.castFrom(json);
    List<FlickrPhoto> list = [];
    list.addAll(
      rawList.map(
        (e) => FlickrPhoto.fromJson(
          e,
        ),
      ),
    );
    return list;
  }
}

class FlickrPhotoSizes {
  final List<FlickrPhotoSize> sizes;

  FlickrPhotoSizes({
    this.sizes,
  });

  factory FlickrPhotoSizes.fromJson(Map<String, dynamic> json) {
    final sizeJson = json['sizes'];

    return FlickrPhotoSizes(
      sizes: FlickrPhotoSize.fromJsonList(
        sizeJson['size'],
      ),
    );
  }

  FlickrPhotoSize get largestSize => sizes.last;
}

class FlickrPhotoSize {
  final int width;
  final int height;
  final String label;
  final String source;
  final String media;

  FlickrPhotoSize({
    this.width,
    this.height,
    this.label,
    this.source,
    this.media,
  });

  factory FlickrPhotoSize.fromJson(Map<String, dynamic> json) {
    return FlickrPhotoSize(
      label: json['label'],
      height: json['height'],
      width: json['width'],
      media: json['media'],
      source: json['source'],
    );
  }

  static List<FlickrPhotoSize> fromJsonList(dynamic json) {
    List<dynamic> rawList = List.castFrom(json);
    List<FlickrPhotoSize> list = [];
    list.addAll(
      rawList.map(
        (e) => FlickrPhotoSize.fromJson(
          e,
        ),
      ),
    );
    return list;
  }
}
