import 'dart:convert';

List<News> newsFromJson(String str) => List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
    News({
        this.id,
        this.title,
        this.shortDescription,
        this.url,
        this.image,
        this.mobileImage,
        this.alt,
        this.date,
        this.tags,

    });

    int id;
    String title;
    String shortDescription;
    String url;
    String image;
    bool mobileImage;
    String alt;
    String date;
    String tags;


    factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        title: json["title"],
        shortDescription: json["shortDescription"],
        url: json["url"],
        image: json["image"],
        mobileImage: json["mobileImage"],
        alt: json["alt"],
        date: json["date"],
        tags: json["tags"],
        
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "shortDescription": shortDescription,
        "url": url,
        "image": image,
        "mobileImage": mobileImage,
        "alt": alt,
        "date": date,
        "tags": tags,

    };
}