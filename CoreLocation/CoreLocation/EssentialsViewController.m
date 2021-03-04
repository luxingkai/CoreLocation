//
//  EssentialsViewController.m
//  CoreLocation
//
//  Created by tigerfly on 2021/3/3.
//  Copyright © 2021 tigerfly. All rights reserved.
//

#import "EssentialsViewController.h"

@interface EssentialsViewController ()

@end

@implementation EssentialsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
#pragma mark -- Adding Location Services to Your App
    
    /*
     Adding Location Services to Your App
     
     Implement features that can access information about a
     user's location.
     
     To add location services to your app, you use CLLocationManager,
     implement its delegate, and decide the authorization mode
     your app requires. When your app runs, it should check if
     the device supports location services, configure and start
     the desired location services, and request authorization to
     receive the user's location. Once authorized, your app receives
     location events for the Core Location services it requests.
     */
    
    /*
     Determine if the User's Device Supports Location Services
     
     Core Location services require hardware that may not be present
     on every device. Before relying on any specific location service,
     check if the device supports the service by calling the methods
     of the CLLocationManager object listedd in Table1. If a method
     returns false, the device does not support that particular service.
     
     - significantLocationChangeMonitoringAvailable
     Indicates whether the device supports getting a user's location
     with the signifcant-change location service.
     
     - isMonitoringAvailableForClass:
     Indicates whether the device supports region monitoring to
     detect entry into or exit from geographic regions or beacon
     regions.
     
     - headingAvailable
     Indicates whether the device is able to provide compass-related
     headings.
     
     - isRangingAvailable
     indicates the device supports obtaining the relative distance
     to a nearby iBeacon device.
     
     ⚠️ If your app can't function on a device that lacks a specific
     hardware-dependent capability, indicate the requirement of that
     service in your app's Info.plist.
     */
    
    
    /*
     Create the location Manager and Delegate
     
     Create an instance of the CLLocationManager class and store a strong
     reference to it somewhere in your app. You must keep a strong
     reference to the location manager object until all tasks involving
     that object complete. Because most location manager task run
     asynchronously, storing your location maneger in a local variable
     is insufficient.
     
     Assign a custom object to the delegate property, conforming to the
     CLLocationManagerDelegate protocol. Assign the delegate before
     starting any location services. The system calls your delegate
     object methods from the thread in which you started the corresponding
     location services. That thread must itself have an active run loop,
     like the one found in your app's main thread.
     */
    
    /**
     Handle Errors in the Delegate Methods

     Implement the failure-related methods in the delegate to fail
     gracefully when location services are not available on a device.
     If you try to start an unavailable service, the CLLocationManager
     object calls one of the failure-related methods of its delegate.
     For example, if region monitoring is unavailable, the object
     calls the locationManager:monitoringDidFailForRegion:withError:
     method. You may want to update the UI in your app when specific
     location services are not available.
     */
    
    /**
     Ask for Authorization and Handle Changes

     Determine the authorization status your app needs. Ask for
     authorization to use location services when your users access
     location related functionality in your app. See Choosing the
     Location Services Authorization to Request for more information.
     
     Implement your delegate’s locationManager:didChangeAuthorizationStatus:,
     which the system calls as soon as your app creates the location manager,
     and any time your app’s authorization status changes. Use this method
     to respond to changes in your app’s authorization status and perform
     the appropriate actions for each state. For example, you may want to
     turn on or off your app’s location features as appropriate when
     authorization changes.
     */
    
    /**
     Start Location Services and Receive Events

     You must set the delegate object before you use other methods on
     your CLLocationManager instance. Next, you must:

     •  Call the appropriate method in CLLocationManager to start
        the delivery of events.
     •  Receive location and heading related updates in the associated
        delegate object.
     •  Call the appropriate method in CLLocationManager to stop the
        service when your app no longer needs to receive the location events.
     
     For the services you use, configure any properties associated with
     that service accurately. Core Location manages power aggressively
     by turning off hardware when it’s not needed. For example, setting
     the desired accuracy for location events to one kilometer gives the
     location manager the flexibility to turn off GPS hardware and rely
     solely on the WiFi or cell radios, which can lead to significant
     power savings.
     */
    
    
    
#pragma mark -- CLLocationManager
    
    /*
     The object that you use to start and stop the delivery of
     location-related events to your app.

     You use instances of this class to configure, start, and stop the
     Core Location services. A location manager object supports the
     following location-related activities:

     •  Tracking large or small changes in the user’s current location
        with a configurable degree of accuracy.
     •  Reporting heading changes from the onboard compass.
     •  Monitoring distinct regions of interest and generating location
        events when the user enters or leaves those regions.
     •  Reporting the range to nearby beacons.
     
     Assign a custom object to the delegate property, conforming to
     the CLLocationManagerDelegate protocol. Assign the delegate before
     starting any location services. The system calls the delegate's locationManager:didChangeAuthorizationStatus: method immediately
     when you create a location manager, and again when the app’s
     authorization changes. That delegate handles all location and
     heading-related updates and events.
     
     See Adding Location Services to Your App for more information.
     */
    
    /**
     Determining the Availablility of Services
     
     + significantLocationChangeMonitoringAvailable
     Returns a Boolean value indicating whether the significant-change
     location service is available on the device.
     
     + headingAvailable
     Returns a Boolean value indicating whether the location manager is
     able to generate heading-related events.
     
     authorizedForWidgetUpdates
     A Boolean value that indicates whether a widget is eligible to
     receive location updates.
     
     accuracyAuthorization
     A value that indicates the level of location accuracy the app has
     permission to use.
     
     + isMonitoringAvailableForClass:
     Returns a Boolean value indicating whether the device supports region
     monitoring using the specified class.
     
     + isRangingAvailable
     Returns a Boolean value indicating whether the device supports ranging
     of beacons that use the iBeacon protocol.
     
     + locationServicesEnabled
     Returns a Boolean value indicating whether location services are enabled
     on the device.
     */
    
    /**
     Receiving Data from Location Services

     delegate
     The delegate object to receive update events.
     
     CLLocationManagerDelegate
     The methods that you use to receive events from an associated location
     manager object.
     */
    
    
    /**
     Requesting Authorization for Location Services

     - requestWhenInUseAuthorization
     Requests the user’s permission to use location services while
     the app is in use.
     
     - requestAlwaysAuthorization
     Requests the user’s permission to use location services regardless
     of whether the app is in use.
     
     - requestTemporaryFullAccuracyAuthorizationWithPurposeKey:completion:
     Requests the user’s permission to temporarily use location services
     with full accuracy.
     
     - requestTemporaryFullAccuracyAuthorizationWithPurposeKey:
     Requests the user’s permission to temporarily use location services
     with full accuracy.
     
     authorizationStatus
     The current authorization status for the app.
     
     CLAuthorizationStatus
     Constants indicating the app's authorization to use location services.
     */
    
    /**
     Initiating Standard Location Updates

     - startUpdatingLocation
     Starts the generation of updates that report the user’s current
     location.
     
     - stopUpdatingLocation
     Stops the generation of location updates.
     
     - requestLocation
     Requests the one-time delivery of the user’s current location.
     
     pausesLocationUpdatesAutomatically
     A Boolean value indicating whether the location manager object may
     pause location updates.
     
     allowsBackgroundLocationUpdates
     A Boolean value indicating whether the app should receive location
     updates when suspended.
     
     showsBackgroundLocationIndicator
     A Boolean indicating whether the status bar changes its appearance when
     an app uses location services in the background.
     
     activityType
     The type of user activity associated with the location updates.
     
     CLActivityType
     Constants indicating the type of activity associated with location updates.
     */
    
    /**
     Specifying Distance and Accuracy

     distanceFilter
     The minimum distance (measured in meters) a device must move horizontally
     before an update event is generated.
     
     CLLocationDistanceMax
     A constant indicating the maximum distance.
     
     kCLDistanceFilterNone
     A constant indicating that all movement should be reported.
     
     CLLocationDistance
     A distance measurement (measured in meters) from an existing location.
     
     desiredAccuracy
     The accuracy of the location data that your app wants to receive.
     
     CLLocationAccuracy
     The accuracy of a geographical coordinate.
     */
    
    /**
     Initiating Significant Location Updates

     - startMonitoringSignificantLocationChanges
     Starts the generation of updates based on significant location changes.
     
     - stopMonitoringSignificantLocationChanges
     Stops the delivery of location events based on significant location changes.
     */
    
    /**
     Initiating Heading Updates

     - startUpdatingHeading
     Starts the generation of updates that report the user’s current
     heading.
     
     - stopUpdatingHeading
     Stops the generation of heading updates.
     
     - dismissHeadingCalibrationDisplay
     Dismisses the heading calibration view from the screen immediately.
     
     headingFilter
     The minimum angular change (measured in degrees) required to generate
     new heading events.
     
     kCLHeadingFilterNone
     A constant indicating that all header values should be reported.
     
     CLLocationDegrees
     A latitude or longitude value specified in degrees.
     
     headingOrientation
     The device orientation to use when computing heading values.
     
     CLDeviceOrientation
     Constants indicating the physical orientation of the device.
     */
    
    /**
     Initiating Region Monitoring

     - startMonitoringForRegion:
     Starts monitoring the specified region.
     
     - stopMonitoringForRegion:
     Stops monitoring the specified region.
     
     monitoredRegions
     The set of shared regions monitored by all location manager objects.
     
     maximumRegionMonitoringDistance
     The largest boundary distance that can be assigned to a region.
     */
    
    /**
     Initiating Beacon Ranging Requests

     - requestStateForRegion:
     Retrieves the state of a region asynchronously.
     
     - startRangingBeaconsSatisfyingConstraint:
     Starts the delivery of notifications for the specified beacon constraints.
     
     - stopRangingBeaconsSatisfyingConstraint:
     Stops the delivery of notifications for the specified beacon constraints.
     
     rangedBeaconConstraints
     The set of beacon constraints currently being tracked using ranging.
     */
    
    /**
     Initiating Visit Event Updates

     - startMonitoringVisits
     Starts the delivery of visit-related events.
     
     - stopMonitoringVisits
     Stops the delivery of visit-related events.
     */
    
    /**
     Getting Recently Retrieved Data

     location
     The most recently retrieved user location.
     
     heading
     The most recently reported heading.
     */
    
    
#pragma mark -- CLLocationManagerDelegate
    
    /*
     The methods that you use to receive events from an associated
     location manager object.

     The location manager calls its delegate’s methods to report
     location-related events to your app. Implement this protocol
     in an app-specific object and use the methods to update your
     app. For example, you might use the current location to update
     the user’s position on a map or you might return search results
     relevant only to the user’s current location.

     ⚠️ Always implement the methods for handling any potential failures
     in addition to the methods for receiving location-related data.
     
     Assign your delegate object to the delegate property of the
     CLLocationManager object before starting any services. Core
     location may report a cached value to your delegate immediately
     after your start the service, followed by a more current value
     later. Check the time stamp of any data objects your receive
     before using them.
     
     The methods of your delegate object are called from the
     thread in which you started the corresponding location
     services. That thread must itself have an active run loop,
     like the one found in your app’s main thread.
     */
    
    /**
     Responding to Authorization Changes

     - locationManagerDidChangeAuthorization:
     Tells the delegate when the app creates the location manager
     and when the authorization status changes.
     */
    
    /**
     Handling Errors

     - locationManager:didFailWithError:
     Tells the delegate that the location manager was unable to
     retrieve a location value.
     */
    
    /**
     Responding to Location Events

     - locationManager:didUpdateLocations:
     Tells the delegate that new location data is available.
     
     - locationManager:didUpdateToLocation:fromLocation:
     Tells the delegate that a new location value is available.
     
     - locationManager:didFinishDeferredUpdatesWithError:
     Tells the delegate that updates will no longer be deferred.
     */
    
    /**
     Pausing Location Updates

     - locationManagerDidPauseLocationUpdates:
     Tells the delegate that location updates were paused.
     
     - locationManagerDidResumeLocationUpdates:
     Tells the delegate that the delivery of location updates has resumed.
     */
    
    /**
     Responding to Heading Events

     - locationManager:didUpdateHeading:
     Tells the delegate that the location manager received updated
     heading information.
     
     - locationManagerShouldDisplayHeadingCalibration:
     Asks the delegate whether the heading calibration alert should
     be displayed.
     */
    
    /**
     Responding to Region Events

     - locationManager:didEnterRegion:
     Tells the delegate that the user entered the specified region.
     
     - locationManager:didExitRegion:
     Tells the delegate that the user left the specified region.
     
     - locationManager:didDetermineState:forRegion:
     Tells the delegate about the state of the specified region.
     
     - locationManager:monitoringDidFailForRegion:withError:
     Tells the delegate that a region monitoring error occurred.
     
     - locationManager:didStartMonitoringForRegion:
     Tells the delegate that a new region is being monitored.
     */
    
    /**
     Responding to Ranging Events

     - locationManager:didRangeBeacons:satisfyingConstraint:
     Tells the delegate that a beacon satisfying the constraint was detected.
     
     - locationManager:didFailRangingBeaconsForConstraint:error:
     Tells the delegate that no beacons were detected that satisfy the constraint.
     */
    
    /**
     Responding to Visit Events

     - locationManager:didVisit:
     Tells the delegate that a new visit-related event was received.
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
