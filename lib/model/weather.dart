// To parse this JSON data, do
//
//     final weather = weatherFromMap(jsonString);

import 'dart:convert';

List<Weather> weatherFromMap(String str) =>
    List<Weather>.from(json.decode(str).map((x) => Weather.fromMap(x)));

String weatherToMap(List<Weather> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Weather {
  Weather({
    required this.consolidatedWeather,
    required this.time,
    required this.sunRise,
    required this.sunSet,
    required this.timezoneName,
    required this.parent,
    required this.sources,
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
    required this.timezone,
  });

  final List<ConsolidatedWeather> consolidatedWeather;
  final DateTime time;
  final DateTime sunRise;
  final DateTime sunSet;
  final String timezoneName;
  final Parent parent;
  final List<Source> sources;
  final String title;
  final String locationType;
  final int woeid;
  final String lattLong;
  final String timezone;

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        consolidatedWeather: List<ConsolidatedWeather>.from(
            json["consolidated_weather"]
                .map((x) => ConsolidatedWeather.fromMap(x))),
        time: DateTime.parse(json["time"]),
        sunRise: DateTime.parse(json["sun_rise"]),
        sunSet: DateTime.parse(json["sun_set"]),
        timezoneName: json["timezone_name"],
        parent: Parent.fromMap(json["parent"]),
        sources:
            List<Source>.from(json["sources"].map((x) => Source.fromMap(x))),
        title: json["title"],
        locationType: json["location_type"],
        woeid: json["woeid"],
        lattLong: json["latt_long"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toMap() => {
        "consolidated_weather":
            List<dynamic>.from(consolidatedWeather.map((x) => x.toMap())),
        "time": time.toIso8601String(),
        "sun_rise": sunRise.toIso8601String(),
        "sun_set": sunSet.toIso8601String(),
        "timezone_name": timezoneName,
        "parent": parent.toMap(),
        "sources": List<dynamic>.from(sources.map((x) => x.toMap())),
        "title": title,
        "location_type": locationType,
        "woeid": woeid,
        "latt_long": lattLong,
        "timezone": timezone,
      };

  @override
  String toString() {
    return 'Weather(consolidatedWeather: $consolidatedWeather, time: $time, sunRise: $sunRise, sunSet: $sunSet, timezoneName: $timezoneName, parent: $parent, sources: $sources, title: $title, locationType: $locationType, woeid: $woeid, lattLong: $lattLong, timezone: $timezone)';
  }
}

class ConsolidatedWeather {
  ConsolidatedWeather({
    required this.id,
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.windDirectionCompass,
    required this.created,
    required this.applicableDate,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.windSpeed,
    required this.windDirection,
    required this.airPressure,
    required this.humidity,
    required this.visibility,
    required this.predictability,
  });

  final int id;
  final String weatherStateName;
  final String weatherStateAbbr;
  final String windDirectionCompass;
  final DateTime created;
  final DateTime applicableDate;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final double windSpeed;
  final double windDirection;
  final double airPressure;
  final int humidity;
  final double visibility;
  final int predictability;

  factory ConsolidatedWeather.fromMap(Map<String, dynamic> json) =>
      ConsolidatedWeather(
        id: json["id"],
        weatherStateName: json["weather_state_name"],
        weatherStateAbbr: json["weather_state_abbr"],
        windDirectionCompass: json["wind_direction_compass"],
        created: DateTime.parse(json["created"]),
        applicableDate: DateTime.parse(json["applicable_date"]),
        minTemp: json["min_temp"].toDouble(),
        maxTemp: json["max_temp"].toDouble(),
        theTemp: json["the_temp"].toDouble(),
        windSpeed: json["wind_speed"].toDouble(),
        windDirection: json["wind_direction"].toDouble(),
        airPressure: json["air_pressure"].toDouble(),
        humidity: json["humidity"],
        visibility: json["visibility"].toDouble(),
        predictability: json["predictability"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "weather_state_name": weatherStateName,
        "weather_state_abbr": weatherStateAbbr,
        "wind_direction_compass": windDirectionCompass,
        "created": created.toIso8601String(),
        "applicable_date":
            "${applicableDate.year.toString().padLeft(4, '0')}-${applicableDate.month.toString().padLeft(2, '0')}-${applicableDate.day.toString().padLeft(2, '0')}",
        "min_temp": minTemp,
        "max_temp": maxTemp,
        "the_temp": theTemp,
        "wind_speed": windSpeed,
        "wind_direction": windDirection,
        "air_pressure": airPressure,
        "humidity": humidity,
        "visibility": visibility,
        "predictability": predictability,
      };

  @override
  String toString() {
    return 'ConsolidatedWeather(id: $id, weatherStateName: $weatherStateName, weatherStateAbbr: $weatherStateAbbr, windDirectionCompass: $windDirectionCompass, created: $created, applicableDate: $applicableDate, minTemp: $minTemp, maxTemp: $maxTemp, theTemp: $theTemp, windSpeed: $windSpeed, windDirection: $windDirection, airPressure: $airPressure, humidity: $humidity, visibility: $visibility, predictability: $predictability)';
  }
}

class Parent {
  Parent({
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
  });

  final String title;
  final String locationType;
  final int woeid;
  final String lattLong;

  factory Parent.fromMap(Map<String, dynamic> json) => Parent(
        title: json["title"],
        locationType: json["location_type"],
        woeid: json["woeid"],
        lattLong: json["latt_long"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "location_type": locationType,
        "woeid": woeid,
        "latt_long": lattLong,
      };

  @override
  String toString() {
    return 'Parent(title: $title, locationType: $locationType, woeid: $woeid, lattLong: $lattLong)';
  }
}

class Source {
  Source({
    required this.title,
    required this.slug,
    required this.url,
    required this.crawlRate,
  });

  final String title;
  final String slug;
  final String url;
  final int crawlRate;

  factory Source.fromMap(Map<String, dynamic> json) => Source(
        title: json["title"],
        slug: json["slug"],
        url: json["url"],
        crawlRate: json["crawl_rate"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "slug": slug,
        "url": url,
        "crawl_rate": crawlRate,
      };

  @override
  String toString() {
    return 'Source(title: $title, slug: $slug, url: $url, crawlRate: $crawlRate)';
  }
}
