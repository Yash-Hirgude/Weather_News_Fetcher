class weatherInfo{
  late final city;
  late final windspeed;
  late final temperature;
  late final humidity;
  weatherInfo(this.city,this.humidity,this.temperature,this.windspeed);
  weatherInfo.fromJson(Map<String,dynamic> json){
    city = json["location"]["name"];
    temperature = json["current"]["temperature"];
    windspeed = json["wind_speed"];
    humidity = json["humidity"];
  }
}