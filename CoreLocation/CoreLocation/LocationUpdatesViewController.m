//
//  LocationUpdatesViewController.m
//  CoreLocation
//
//  Created by tigerfly on 2021/3/3.
//  Copyright © 2021 tigerfly. All rights reserved.
//

#import "LocationUpdatesViewController.h"

@interface LocationUpdatesViewController ()

@end

@implementation LocationUpdatesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
#pragma mark -- Getting the User's Location

    /**
     Receive location data in your app.

     Core Location offers three different services for fetching
     the user's location. Each service offers different benefits
     and comes with different power and authorization requirements.
     You can use a single service or you can use multiple services
     at different times, depending on your needs.

     
     - Visits location service
     The most power-efficient way to gather location data. This
     service delivers location updates when the user has spent
     time in one location and then moves on. Each update includes
     both the location and the amount of time spent at that location.
     
     This service is not intended for navigation or other real-time
     activities. Instead, use it to identify patterns in the user's
     behavior and apply that knowledge to other parts of your app.
     For example, a music app might prepare a workout playlist when
     the user leaves the house and heads to the gym.
     
     - Significant-change location service
     A power-friendly alternative for apps that need to track the
     user's location but do not need frequent updates or the
     precision offered by GPS. This service relies on lower-power
     alternatives to determine the user's location and delivers
     updates only when significant changes to that location occur.
     
     You might use this service to deliver suggestions for nearby
     points of interest when the user is walking.
     
     - Standard location service
     A configurable, general-purpose solution for getting the user's
     location in real time. This service uses significantly more power
     than the other location services, but it delivers the most accurate
     and immediate location information.
     
     Use this service only when you really need it, such as when offering
     navigation instructions or when recording a user's path on a hike.
     
     
     Always choose the most power-efficient service that serves the
     needs of your app. To help save power, disable location services
     (or switch to a lower-power alternative) when you do not need the
     location data offered by the service. For example, you might disable
     location services when your app is in the background and would not
     use that data otherwise.
     */
    
    
#pragma mark -- Using the Visits Location Service
    
    /**
     Get location updates in the most power-efficient way, but less
     frequently than with other services.
     
     The visits service is the most power-efficient way of gathering
     location data. With this service, the system delivers location
     updates only when the user’s movements are noteworthy. Each update
     includes both the location and the amount of time spent at that
     location. This service isn’t intended for navigation or other
     real-time activities, but you can use to identify patterns in
     the user’s behavior and apply that knowledge to other parts of
     your app. For example, a music app might prepare a gym playlist
     if a user arrives at the gym at their normal workout time.

     ⚠️ The visits location service requires authorization. For
     information about how to request authorization, see Requesting
     Authorization for Location Services.
     
     To start the visits location service, call the startMonitoringVisits
     method of your location manager. With this service, the location
     manager ignores the values in its distanceFilter and desiredAccuracy
     properties, so you don’t need to configure them. The location
     manager delivers updates to the locationManager:didVisit: method
     of its delegate.
     
     Another way to save power is to set the
     pausesLocationUpdatesAutomatically property of your location
     manager object to YES. Enabling this property lets the system
     reduce power consumption by disabling location hardware when
     the user is unlikely to be moving. Pausing updates doesn’t
     diminish the quality of those updates, but can improve battery
     life significantly. To help the system determine when to pause
     updates, you must also assign an appropriate value to the
     activityType property of your location manager.
     
     ⚠️ When you no longer need location data, always call your
     location manager object’s stopMonitoringVisits method. If
     you don’t stop location updates, the system continues delivering
     location data to your app, which could drain the battery of
     the user’s device.
     */
    
    /**
     Receiving Visit Updates
     
     When you start the visits location service, a recently
     cached value may be reported to your delegate immediately.
     As new visit data is obtained, the location manager calls
     your delegate’s locationManager:didVisit: method with the
     updated value.

     Listing 1 Receiving visit updates
     func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
         // Do something with the visit.
     }
     */
    
    /**
     Handling Location-Related Errors

     When the location manager is unable to deliver location updates,
     it calls the locationManager:didFailWithError: method of its
     delegate object. You should always implement this delegate
     method to handle any errors that might occur. For example,
     this method is called when the user denies authorization for
     your app to use location services. In such a scenario, you
     might want to disable location-related features and notify
     the user which features are unavailable. You should also stop
     whatever service you previously started, as demonstrated in
     Listing 2.
     
     Listing 2 Stopping location services when authorization is denied
     func locationManager(_ manager: CLLocationManager,  didFailWithError error: Error) {
        if error.code == .denied {
           // Location updates are not authorized.
           locationManager.stopMonitoringVisits()
           return
        }
        // Notify the user of any errors.
     }
     */
    
    
#pragma mark -- CLLocation
    
    /*
     The latitude, longitude, and course information reported by
     the system.

     A CLLocation object contains the geographical location and
     altitude of a device, along with values indicating the accuracy
     of those measurements and when they were collected. In iOS, a
     location object also contains course information — that is, the
     speed and heading in which the device was moving.
     
     Typically, you don’t create location objects yourself. After you
     request location updates from your CLLocationManager object, the
     system uses onboard sensors to gather location data and report
     that data to your app. Some services also return previously
     collected location data, which you can use as context to improve
     your services. You can always retrieve the most recently collected
     location from the UIApplicationLaunchOptionsLocationKey property
     of your CLLocationManager object. You may create location objects
     yourself when you want to cache custom location data or calculate
     the distance between two geographical coordinates.
     
     Use CLLocation objects as-is, and don’t subclass them.
     */
    
    /**
     Initializing a Location Object
     
     - initWithLatitude:longitude:
     Creates a location object with the specified latitude and longitude.
     
     - initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:
     Creates a location object with the specified coordinate and altitude information.
     
     - initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:
     course:speed:timestamp:
     Creates a location object with the specified coordinate, altitude,
     and course information.
     
     - initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course
     :courseAccuracy:speed:speedAccuracy:timestamp:
     Creates a location object with the specified coordinate, altitude,
     course, and accuracy information.
     */
    
    /**
     Getting the Location Attributes

     coordinate
     The geographical coordinate information.
     
     altitude
     The altitude, measured in meters.
     
     floor
     The logical floor of the building in which the user is located.
     
     horizontalAccuracy
     The radius of uncertainty for the location, measured in meters.
     
     verticalAccuracy
     The accuracy of the altitude value, measured in meters.
     
     speedAccuracy
     The accuracy of the speed value, measured in meters per second.
     
     courseAccuracy
     The accuracy of the course value, measured in degrees.
     
     timestamp
     The time at which this location was determined.
     */
    
    /**
     Measuring the Distance Between Coordinates

     - distanceFromLocation:
     Returns the distance (measured in meters) from the current
     object’s location to the specified location.
     */
    
    /**
     Getting Speed and Course Information

     speed
     The instantaneous speed of the device, measured in meters per second.
     
     course
     The direction in which the device is traveling, measured in
     degrees and relative to due north.
     */
    
    /**
     Data Types

     CLLocationSpeed
     The velocity (measured in meters per second) at which the
     device is moving.
     
     CLLocationDirection
     An azimuth that is measured in degrees relative to true north.
     
     CLLocationDistance
     A distance measurement (measured in meters) from an existing location.
     
     CLLocationAccuracy
     The accuracy of a geographical coordinate.
     
     CLLocationSpeedAccuracy
     The accuracy of a speed.
     
     CLLocationDirectionAccuracy
     The accuracy of a compass heading.
     */
    

#pragma mark -- CLLocationCoordinate2D
    
    /*
     The latitude and longitude associated with a location,
     specified using the WGS 84 reference frame.
     */
    
    /**
     Coordinates
     
     latitude
     The latitude in degrees.
     
     longitude
     The longitude in degrees.
     */
    
    /**
     Coordinate Functions

     CLLocationCoordinate2DIsValid
     Returns a Boolean value indicating whether the specified
     coordinate is valid.
     
     CLLocationCoordinate2DMake
     Formats a latitude and longitude value into a coordinate
     data structure format.
     */
    
    /**
     Constants
     
     kCLLocationCoordinate2DInvalid
     An invalid coordinate value.
     */
    

#pragma mark -- CLFloor
    
    /*
     The floor of a building on which the user's device is located.
     
     A CLFloor object specifies the floor of the building on which
     the device is located. In places where floor information can
     be determined, a CLLocation object may include a floor object
     along with the regular location data.
     
     You do not create instances of this class directly, nor should
     you subclass it.
     */
    
    /**
     Getting the Floor Level
     
     level
     The logical floor of the building.
     */
    
    
#pragma mark -- CLVisit
    
    /**
     Information about the user's location during a specific period of
     time.
     
     A CLVisit object encapsulates information about places that the
     user has been. Visit objects are created by the system and delivered
     by the CLLocationManager object to its delegate after you start
     the delivery of events. The visit includes the location where
     the visit occurred and information about the arrival and departure
     times as relevant. You do not create visit objects directly, nor
     should you subclass CLVisit.
     
     Visit objects contain as much information about the visit as
     possible but may not always include both the arrival and departure
     times. For example, when the user arrives at a location, the system
     may send an event with only an arrival time. When the user departs
     a location, the event can contain both the arrival time (if your app
     was monitoring visits prior to the user’s arrival) and the departure
     time.
     */
    
    /**
     Getting the Location of the Visit
     
     coordinate
     The geographical coordinate information.
     
     horizontalAccuracy
     The horizontal accuracy (in meters) of the specified coordinate.
     */
    
    /**
     Getting the Duration of the Visit
     
     arrivalDate
     The approximate time at which the user arrived at the specified
     location.
     
     departureDate
     The approximate time at which the user left the specified location.
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
