/**
 * You can edit, run, and share this code.
 * play.kotlinlang.org
 */
data class City(val name: String, val latitude: Double, val longitude: Double)
var cityList: List<City> = emptyList()

fun listCities() : List<City>
{

    var cities: MutableList<City> = mutableListOf( City("Atlanta",33.7490,-84.3880), City("Bozeman", 45.6770,-111.0429), City("New York", 40.7128, -74.0060), City("San Francisco", 37.7749, -122.4194), City("Tacoma", 47.2529, -122.4443))
    return cities
}

fun haversine(lat1: Double, lon1: Double, lat2: Double, lon2: Double): Double {
    val R = 6372.8 // in kilometers
    val l1 = Math.toRadians(lat1)
    val l2 = Math.toRadians(lat2)
    val dl = Math.toRadians(lat2 - lat1)
    val dr = Math.toRadians(lon2 - lon1)
    return 2 * R * Math.asin(Math.sqrt(Math.pow(Math.sin(dl / 2), 2.0) +Math.pow(Math.sin(dr / 2), 2.0) * Math.cos(l1) * Math.cos(l2)))}

fun distanceFromSeattle(c : City) : Double
{
    var seattle: City = City("Seattle", 47.6062, -122.3321)
    var distance: Double = haversine(c.latitude, c.longitude, seattle.latitude, seattle.longitude)
    return distance
}


fun map(){
    var cityMapMutable = mutableMapOf<String, City>()
	cityList.forEach{
       i -> cityMapMutable.put(i.name, i)
    }
    var cityMap : Map<String, City> = cityMapMutable
    cityMap.forEach{
        k, v -> println("Name $k: City $v")
    }
}


fun main() {

   println("********STEP TWO********")
   cityList = listCities()
   cityList.forEach {
         i -> println("$i")
   }


   println("********STEP THREE********")
   var seattleDist: Double = distanceFromSeattle(cityList.last())
   println("The distance between Seattle and Tacoma is $seattleDist km")

   println("********STEP FOUR********")
   println("A new list with the distances of all cities to Seattle:")
   var distList = cityList.map { it -> distanceFromSeattle(it)}

   println(distList)

   println("********STEP FIVE********")
   println("List of Cities over 1000km from Seattle (used the return list from the Filter function and just printed the city name)")

   var farCities = cityList.filter {it -> distanceFromSeattle(it) > 1000}
   farCities.forEach{i -> println(i.name)}

   println("********STEP SIX********")

   var westCities =cityList.filter {it -> it.longitude < -89.97803}

   var westCitiesNames = westCities.map{it -> it.name}

   println(westCitiesNames)

   println("********STEP SEVEN********")

   var maxDistCity = cityList.maxBy{it -> distanceFromSeattle(it)}

   println("Max Distance: $maxDistCity")

   println("********STEP EIGHT********")
   map()





}
