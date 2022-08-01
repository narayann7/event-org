class Events {
  String? status;
  String? message;
  List<Allevents>? allevents;
  List<Allevents>? liveevents;

  Events({this.status, this.message, this.allevents, this.liveevents});

  Events.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['allevents'] != null) {
      allevents = <Allevents>[];
      json['allevents'].forEach((v) {
        allevents!.add(Allevents.fromJson(v));
      });
    }
    if (json['liveevents'] != null) {
      liveevents = <Allevents>[];
      json['liveevents'].forEach((v) {
        liveevents!.add(Allevents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (allevents != null) {
      data['allevents'] = allevents!.map((v) => v.toJson()).toList();
    }
    if (liveevents != null) {
      data['liveevents'] = liveevents!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Events(status: $status, message: $message, allevents: $allevents, liveevents: $liveevents)';
  }
}

class Allevents {
  int? eventId;
  String? eventName;
  int? eventCategoryId;
  int? eventOrganizerId;
  String? eventDescription;
  String? eventStartdate;
  String? eventEnddate;
  String? eventStarttime;
  String? eventEndtime;
  String? eventType;
  String? eventBanneroneimg;
  String? eventCode;
  int? eventMixlimit;
  String? eventBannertwoimg;
  String? eventQrcode;
  String? eventLocation;
  String? eventGoogleMapLink;
  int? eventStatus;
  String? eventCreatedAt;
  int? categoryId;
  int? categoryFor;
  String? categoryName;
  String? categoryImage;
  int? categoryStatus;
  String? categoryCreatedAt;
  String? eventBannerImg1;
  String? eventBannerImg2;
  int? rating;
  String? isBooking;
  String? isRates;
  String? isAgenda;
  String? isSpeaker;
  String? isCheckin;

  Allevents(
      {this.eventId,
      this.eventName,
      this.eventCategoryId,
      this.eventOrganizerId,
      this.eventDescription,
      this.eventStartdate,
      this.eventEnddate,
      this.eventStarttime,
      this.eventEndtime,
      this.eventType,
      this.eventBanneroneimg,
      this.eventCode,
      this.eventMixlimit,
      this.eventBannertwoimg,
      this.eventQrcode,
      this.eventLocation,
      this.eventGoogleMapLink,
      this.eventStatus,
      this.eventCreatedAt,
      this.categoryId,
      this.categoryFor,
      this.categoryName,
      this.categoryImage,
      this.categoryStatus,
      this.categoryCreatedAt,
      this.eventBannerImg1,
      this.eventBannerImg2,
      this.rating,
      this.isBooking,
      this.isRates,
      this.isAgenda,
      this.isSpeaker,
      this.isCheckin});

  Allevents.fromJson(Map<String, dynamic> json) {
    eventId = json['eventId'];
    eventName = json['eventName'];
    eventCategoryId = json['eventCategory_id'];
    eventOrganizerId = json['eventOrganizer_id'];
    eventDescription = json['eventDescription'];
    eventStartdate = json['eventStartdate'];
    eventEnddate = json['eventEnddate'];
    eventStarttime = json['eventStarttime'];
    eventEndtime = json['eventEndtime'];
    eventType = json['eventType'];
    eventBanneroneimg = json['eventBanneroneimg'];
    eventCode = json['eventCode'];
    eventMixlimit = json['eventMixlimit'];
    eventBannertwoimg = json['eventBannertwoimg'];
    eventQrcode = json['eventQrcode'];
    eventLocation = json['eventLocation'];
    eventGoogleMapLink = json['eventGoogleMapLink'];
    eventStatus = json['eventStatus'];
    eventCreatedAt = json['eventCreated_at'];
    categoryId = json['categoryId'];
    categoryFor = json['categoryFor'];
    categoryName = json['categoryName'];
    categoryImage = json['categoryImage'];
    categoryStatus = json['categoryStatus'];
    categoryCreatedAt = json['categoryCreated_at'];
    eventBannerImg1 = json['event_banner_img1'];
    eventBannerImg2 = json['event_banner_img2'];
    rating = json['Rating'];
    isBooking = json['isBooking'];
    isRates = json['isRates'];
    isAgenda = json['isAgenda'];
    isSpeaker = json['isSpeaker'];
    isCheckin = json['isCheckin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventId'] = eventId;
    data['eventName'] = eventName;
    data['eventCategory_id'] = eventCategoryId;
    data['eventOrganizer_id'] = eventOrganizerId;
    data['eventDescription'] = eventDescription;
    data['eventStartdate'] = eventStartdate;
    data['eventEnddate'] = eventEnddate;
    data['eventStarttime'] = eventStarttime;
    data['eventEndtime'] = eventEndtime;
    data['eventType'] = eventType;
    data['eventBanneroneimg'] = eventBanneroneimg;
    data['eventCode'] = eventCode;
    data['eventMixlimit'] = eventMixlimit;
    data['eventBannertwoimg'] = eventBannertwoimg;
    data['eventQrcode'] = eventQrcode;
    data['eventLocation'] = eventLocation;
    data['eventGoogleMapLink'] = eventGoogleMapLink;
    data['eventStatus'] = eventStatus;
    data['eventCreated_at'] = eventCreatedAt;
    data['categoryId'] = categoryId;
    data['categoryFor'] = categoryFor;
    data['categoryName'] = categoryName;
    data['categoryImage'] = categoryImage;
    data['categoryStatus'] = categoryStatus;
    data['categoryCreated_at'] = categoryCreatedAt;
    data['event_banner_img1'] = eventBannerImg1;
    data['event_banner_img2'] = eventBannerImg2;
    data['Rating'] = rating;
    data['isBooking'] = isBooking;
    data['isRates'] = isRates;
    data['isAgenda'] = isAgenda;
    data['isSpeaker'] = isSpeaker;
    data['isCheckin'] = isCheckin;
    return data;
  }

  @override
  String toString() {
    return 'Allevents(eventId: $eventId, eventName: $eventName, eventCategoryId: $eventCategoryId, eventOrganizerId: $eventOrganizerId, eventDescription: $eventDescription, eventStartdate: $eventStartdate, eventEnddate: $eventEnddate, eventStarttime: $eventStarttime, eventEndtime: $eventEndtime, eventType: $eventType, eventBanneroneimg: $eventBanneroneimg, eventCode: $eventCode, eventMixlimit: $eventMixlimit, eventBannertwoimg: $eventBannertwoimg, eventQrcode: $eventQrcode, eventLocation: $eventLocation, eventGoogleMapLink: $eventGoogleMapLink, eventStatus: $eventStatus, eventCreatedAt: $eventCreatedAt, categoryId: $categoryId, categoryFor: $categoryFor, categoryName: $categoryName, categoryImage: $categoryImage, categoryStatus: $categoryStatus, categoryCreatedAt: $categoryCreatedAt, eventBannerImg1: $eventBannerImg1, eventBannerImg2: $eventBannerImg2, rating: $rating, isBooking: $isBooking, isRates: $isRates, isAgenda: $isAgenda, isSpeaker: $isSpeaker, isCheckin: $isCheckin)';
  }
}
