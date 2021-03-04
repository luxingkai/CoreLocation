//
//  GeocodingViewController.m
//  CoreLocation
//
//  Created by tigerfly on 2021/3/3.
//  Copyright © 2021 tigerfly. All rights reserved.
//

#import "GeocodingViewController.h"

@interface GeocodingViewController ()

@end

@implementation GeocodingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
#pragma mark -- Converting Between Coordinates and User-Friendly Place Names

    /*
     Convert between a latitude/longitude pair and a more user-friendly
     description of that location.

     The CLLocationManager object reports locations as a latitude/longitude
     pair. While these values uniquely represent any location on the planet,
     they are not values that users immediately associate with the location.
     Users are more familiar with names that describe a location, such as
     street names or city names. The CLGeocoder class lets you convert between
     geographic coordinates and the user-friendly names associated with that
     location. You can convert from either a latitude/longitude pair to a
     user friendly place name, or the other way around.
     
     User place names are represented by a CLPlacemark object, which
     contains properties for specifying the street name, city name,
     country or region name, postal code, and many others. Placemarks
     also contain properties describing relevant geographic features
     or points of interest at the location, such as the names of mountains,
     rivers, businesses, or landmarks.
     
     Geocoder objects are one-shot objects—that is, you use each object
     to make a single conversion. You can create multiple geocoder
     objects and perform multiple conversions, but Apple rate limits
     the number of conversions you can perform. Making too many
     requests in a short period of time may cause some of those
     requests to fail. For tips on how to manage any conversions,
     see the overview of CLGeocoder.
     */
    
    
    /**
     Convert a Coordinate into a Placemark

     If you have a CLLocation object, call the
     reverseGeocodeLocation:completionHandler: method of your
     geocoder object to retrieve a CLPlacemark object for that
     location. Typically, you convert coordinates into placemarks
     when you want to display information about the location to
     the user. For example, if the user selects a location on a
     map, you might want to show the address at that location.
     
     Listing 1 shows how to obtain placemark information for the
     last location reported by the CLLocationManager object.
     Because calls to the geocoder object are asynchronous, the
     caller of this method passes in a completion handler, which
     is executed with the results.

     Listing 1 Reverse geocoding a coordinate
     func lookUpCurrentLocation(completionHandler: @escaping (CLPlacemark?)
                     -> Void ) {
         // Use the last reported location.
         if let lastLocation = self.locationManager.location {
             let geocoder = CLGeocoder()
                 
             // Look up the location and pass it to the completion handler
             geocoder.reverseGeocodeLocation(lastLocation,
                         completionHandler: { (placemarks, error) in
                 if error == nil {
                     let firstLocation = placemarks?[0]
                     completionHandler(firstLocation)
                 }
                 else {
                  // An error occurred during geocoding.
                     completionHandler(nil)
                 }
             })
         }
         else {
             // No location was available.
             completionHandler(nil)
         }
     }
     */
    
    /**
     Convert a Placemark into a Coordinate

     If you have user-provided address information, call the methods
     of CLGeocoder to obtain the corresponding location data. The
     CLGeocoder class provides options for converting a user-typed
     string or for converting a dictionary of address-related information.
     That information is forwarded to Apple servers, which interpret
     the information and return the results.
     
     Depending on the precision of the user-provided information,
     you may receive one result or multiple results. For example,
     passing a string of "100 Main St., USA" may return many
     results unless you also specify a search region or additional
     details. To help you decide which result is correct, the
     geocoder actually returns CLPlacemark objects, which contain
     both the coordinate and the original information that you provided.
     
     Listing 2 shows how you might obtain a coordinate value from a
     user-provided string. The example calls the provided completion
     handler with only the first result. If the string does not
     correspond to any location, the method calls the completion
     handler with an error and an invalid coordinate.
     
     
     Listing 2 Getting a coordinate from an address string
     func getCoordinate( addressString : String,
             completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
         let geocoder = CLGeocoder()
         geocoder.geocodeAddressString(addressString) { (placemarks, error) in
             if error == nil {
                 if let placemark = placemarks?[0] {
                     let location = placemark.location!
                         
                     completionHandler(location.coordinate, nil)
                     return
                 }
             }
             completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
         }
     }
     */
    

#pragma mark -- CLGeocoder
    
    /**
     CLGeocoder
     
     An interface for converting between geographic coordinates
     and place names.
     
     The CLGeocoder class provides services for converting between
     a coordinate (specified as a latitude and longitude) and the
     user-friendly representation of that coordinate. A user-friendly
     representation of the coordinate typically consists of the street,
     city, state, and country or region information corresponding to
     the given location, but it may also contain a relevant point of
     interest, landmarks, or other identifying information. A geocoder
     object is a single-shot object that works with a network-based
     service to look up placemark information for its specified
     coordinate value.
     
     To use a geocoder object, you create it and call one of its
     forward- or reverse-geocoding methods to begin the request.
     Reverse-geocoding requests take a latitude and longitude value
     and find a user-readable address. Forward-geocoding requests
     take a user-readable address and find the corresponding latitude
     and longitude value. Forward-geocoding requests may also return
     additional information about the specified location, such as a
     point of interest or building at that location. For both types
     of request, the results are returned using a CLPlacemark object.
     In the case of forward-geocoding requests, multiple placemark
     objects may be returned if the provided information yielded
     multiple possible locations.
     
     To make smart decisions about what types of information to
     return, the geocoder server uses all the information provided
     to it when processing the request. For example, if the user
     is moving quickly along a highway, it might return the name
     of the overall region, and not the name of a small park that
     the user is passing through.
     */
    
    /**
     Tips for Using a Geocoder Object

     Apps must be conscious of how they use geocoding. Geocoding
     requests are rate-limited for each app, so making too many
     requests in a short period of time may cause some of the
     requests to fail. (When the maximum rate is exceeded, the
     geocoder returns an error object with the kCLErrorNetwork
     error to the associated completion handler.) Here are some
     rules of thumb for using this class effectively:
     •  Send at most one geocoding request for any one user action.
     •  If the user performs multiple actions that involve
        geocoding the same location, reuse the results from the
        initial geocoding request instead of starting individual
        requests for each action.
     •  When you want to update the user’s current location automatically
        (such as when the user is moving), issue new geocoding requests
        only when the user has moved a significant distance and after a
        reasonable amount of time has passed. For example, in a typical
        situation, you should not send more than one geocoding request
        per minute.
     •  Do not start a geocoding request at a time when the user will
        not see the results immediately. For example, do not start
        a request if your application is inactive or in the background.

     The computer or device must have access to the network in order
     for the geocoder object to return detailed placemark information.
     Although, the geocoder stores enough information locally to report
     the localized country or region name and ISO country code for many
     locations. If this information isn’t available for a specific
     location, the geocoder may still report an error to your completion
     block.
     
     You can use geocoder objects either in conjunction with, or
     independent of, the classes of the MapKit framework.
     */
    
    /**
     Reverse Geocoding a Location

     - reverseGeocodeLocation:preferredLocale:completionHandler:
     Submits a reverse-geocoding request for the specified location and locale.
     
     - reverseGeocodeLocation:completionHandler:
     Submits a reverse-geocoding request for the specified location.
     */
    
    /**
     Geocoding an Address

     - geocodeAddressString:inRegion:preferredLocale:completionHandler:
     Submits a forward-geocoding requesting using the specified address
     string and locale information.
     
     - geocodeAddressString:completionHandler:
     Submits a forward-geocoding request using the specified string.
     
     - geocodeAddressString:inRegion:completionHandler:
     Submits a forward-geocoding request using the specified string and
     region information.
     
     - geocodePostalAddress:completionHandler:
     Submits a forward-geocoding requesting using the specified Contacts framework
     information.
     
     - geocodePostalAddress:preferredLocale:completionHandler:
     Submits a forward-geocoding requesting using the specified locale
     and Contacts framework information.
     */

    /**
     Managing Geocoding Requests
     
     - cancelGeocode
     Cancels a pending geocoding request.
     
     geocoding
     A Boolean value indicating whether the receiver is in the middle
     of geocoding its value.
     */
    
    
#pragma mark -- CLPlacemark
    
    /**
     A user-friendly description of a geographic coordinate, often
     containing the name of the place, its address, and other
     relevant information.

     A CLPlacemark object stores placemark data for a given latitude
     and longitude. Placemark data includes information such as the
     country or region, state, city, and street address associated
     with the specified coordinate. It can also include points of
     interest and geographically related data.
     
     When you reverse geocode a geographic coordinate using a CLGeocoder
     object, you receive a CLPlacemark object containing the descriptive
     information for that location. You can also create CLPlacemark
     object and fill it with address information yourself, which you
     might do when you want to determine the geographic coordinate
     associated with the location.
     */
    
    /**
     Initializing a Placemark Object
     - initWithPlacemark:
     Initializes and returns a placemark object from another placemark object.
     
     + placemarkWithLocation:name:postalAddress:
     Creates and initializes a placemark object using the specified location
     and address information.
     */

    /**
     Accessing the Location Data

     location
     The location object containing latitude and longitude information.
     */
    
    /**
     Accessing the Placemark Attributes

     name
     The name of the placemark.
     
     ISOcountryCode
     The abbreviated country or region name.
     
     country
     The name of the country or region associated with the placemark.
     
     postalCode
     The postal code associated with the placemark.
     
     administrativeArea
     The state or province associated with the placemark.
     
     subAdministrativeArea
     Additional administrative area information for the placemark.
     
     locality
     The city associated with the placemark.
     
     subLocality
     Additional city-level information for the placemark.
     
     thoroughfare
     The street address associated with the placemark.
     
     subThoroughfare
     Additional street-level information for the placemark.
     
     region
     The geographic region associated with the placemark.
     
     timeZone
     The time zone associated with the placemark.
     */
    
    /**
     Accessing Address Information
     
     postalAddress
     The postal address associated with the location, formatted for
     use with the Contacts framework.
     */
    
    /**
     Accessing Geographic Information

     inlandWater
     The name of the inland water body associated with the placemark.
     
     ocean
     The name of the ocean associated with the placemark.
     */
    
    /**
     Accessing Landmark Information
     
     areasOfInterest
     The relevant areas of interest associated with the placemark.
     */
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
