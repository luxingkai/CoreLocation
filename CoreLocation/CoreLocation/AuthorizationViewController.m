//
//  AuthorizationViewController.m
//  CoreLocation
//
//  Created by tigerfly on 2021/3/3.
//  Copyright © 2021 tigerfly. All rights reserved.
//

#import "AuthorizationViewController.h"

@interface AuthorizationViewController ()

@end

@implementation AuthorizationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
#pragma mark -- Choosing the Location Services Authorization to Request

    /**
     Determine the authorization your app needs to access location data.

     The authorization status that your app has determines if and
     when it receives location events. There are two types of
     authorization your app can request:

     When In Use
     Your app can use all location services and receive events while
     the app is in use. In general, iOS apps are considered in use
     when they're in the foreground or running in the background with
     the background location usage indicator enabled.
     
     Always
     Your app can use all location services and receive events
     even if the user is not aware that your app is running. If
     your app isn’t running, the system launches your app and
     delivers the event.
     */
    
    
    /**
     Prefer When in Use Authorization
     
     Whenever possible, request only When In Use authorization.
     This mode has powerful features, allowing your app to:

     •  Access all available location services while the user
        is using the app. If the user stops using your app, any
        outstanding requests suspend until the user resumes using
        your app.
     •  Continue to get location updates even after your app enters
        the background, if you’ve enabled background location updates
        in your Xcode project.
     •  Use location notification triggers to launch. If your app can
        rely on your user’s interaction, set up a
        UNLocationNotificationTrigger to notify users when they enter
        a relevant region. When users click through the notification,
        the system launches the app, making it eligible to receive the
        location event. This method lets users decide at a relevant
        moment whether to share their location with your app.
     
     Location services are available to apps with
     kCLAuthorizationStatusAuthorizedWhenInUse only while the app
     is “in use”. On all platforms that support When In Use authorization,
     an app is considered in use:
     •  When the app runs in the foreground.
     •  In the few seconds after an app leaves the foreground, a
        short grace period for your app to finish any current location
        tasks the user initiated.
     •  When the app shows the background location usage indicator
        (showsBackgroundLocationIndicator). On iOS, the indicator
        is a blue bar or pill at the top of the screen; on watchOS
        it’s a small icon.
     
     For watchOS, the system always considers a complication on
     the current watch face to be in use. However, while the
     complication can receive location updates, you request
     authorization prompts from the main watch app. On watchOS
     there’s no way to opt out of showing the background location
     usage indicator.
     */
    
    
#pragma mark -- Requseting Authorization for Location Services
    
    /**
     Ask the user for permission to access their location.
     
     It's important to take great care with a user's location
     data, and the system requires your app to get the user's
     authorization to access this kind of information. To request
     authorization, call requestWhenInUseAuthorization or
     requestAlwaysAuthorization, depending on the authorization
     status your app needs. See Choosing the Location Services
     Authorization to Request for more information about deciding
     what type of authorization to request. Your Xcode project
     must be configured with purpose strings used in the
     authorization prompts.
     */
    
    /**
     Configure Purpose Strings in Xcode

     To prepare your app for calling requestWhenInUseAuthorization
     or requestAlwaysAuthorization, you must add keys with purpose
     strings to your app's Info.plist file. The system displays
     your purpose strings in the authorization request dialogs.
     Configure the keys in Xcode with the purpose strings that
     your app requires.
     
     NSLocationWhenInUseUsageDescription
     Your app requests When In Use authorization or Always authorization.
     
     NSLocationAlwaysAndWhenInUseUsageDescription
     Your app requests Always authorization.
     
     NSLocationUsageDescription
     Your app runs in macOS and uses location services.
     
     NSLocationAlwaysUsageDescription
     Your app supports iOS 10 and earlier and requests Always
     authorization.
     
     ⚠️ You must add the required keys to your app’s Info.plist file.
     If a required key isn’t present, authorization requests fail immediately.
     */
    
    /**
     Ask for Authorization During Location-Related Activities

     Consider the context of the user's interactions when you request
     authorization to use their location.

     •  Request authorization only when your user needs location services
        to perform a task in your app. If it's not clear to the user
        why your app is using location services, the user may deny
        your request.
     •  Don't automatically ask for authorization when your app returns
        to the foreground. If your app has temporary authorization, it
        loses it when the user stops using your app. Unless the user expects
        you to continue using their location, wait until the user needs the
        location to be updated again before requesting authorization.

     ⚠️ Your app must be in the foreground in order to show a location
        authorization prompt.

     Call requestWhenInUseAuthorization or requestAlwaysAuthorization
     to request authorization at the point where you need location services.
     You may request When In Use authorization as needed; there are no limits
     on calling requestWhenInUseAuthorization. The system does limit calls
     to requestAlwaysAuthorization; you may request it only one time.
     
     After making an authorization request, it’s safe to start location
     services before your request resolves. However, you won't receive
     location events until your app's authorization status changes to kCLAuthorizationStatusAuthorizedAlways or
     kCLAuthorizationStatusAuthorizedWhenInUse. Implement the
     locationManager:didChangeAuthorizationStatus: method in your
     location manager delegate to be notified when your app's
     authorization status changes.
     */
    
    
#pragma mark -- Responding to Changes in Authorization Status
    
    /**
     Receive and respond to changes in your app's authorization
     status in your delegate's method.
     
     When you request authorization, or when your app's authorization
     status changes, use the locationManager:didChangeAuthorizationStatus:
     method of your delegate object to process the changes. Listing 1
     shows an implementation of that method that enables the app's
     location-related features when the app receives authorization and
     disables those features when authorization is denied or restricted
     for any reason.
     
     Listing 1 Responding to the app's authorization status
     
     func locationManager(_ manager: CLLocationManager,
                          didChangeAuthorization status: CLAuthorizationStatus) {   switch status {
           case .restricted, .denied:
              // Disable your app's location features
              disableMyLocationBasedFeatures()
              break
                 
           case .authorizedWhenInUse:
              // Enable your app's location features.
              enableMyLocationFeatures()
              break
                 
           case .authorizedAlways:
              // Enable or prepare your app's location features that can run any time.
              enableMyAlwaysFeatures()
              break
                 
           case .notDetermined:
              break
        }
     }
     
     ⚠️ The availability of location services may change at any time.
     The user can disable location services in the system settings,
     either for your app specifically or for all apps. If your app
     is running (either in the foreground or in the background) when
     the availability status changes, the system calls your
     locationManager:didChangeAuthorizationStatus: method to notify
     you of the change.
     */
    
    
#pragma mark -- CLAuthorizationStatus
    
    /*
     Constants indicating the app's authorization to use location services.

     Handle changes to authorization status in your location manager's
     delegate method, locationManager:didChangeAuthorizationStatus:.

     Authorization Status
     
     kCLAuthorizationStatusNotDetermined
     The user has not chosen whether the app can use location services.
     
     kCLAuthorizationStatusRestricted
     The app is not authorized to use location services.
     
     kCLAuthorizationStatusDenied
     The user denied the use of location services for the app or they
     are disabled globally in Settings.
     
     kCLAuthorizationStatusAuthorized
     The user authorized the app to use location services.
     
     kCLAuthorizationStatusAuthorizedAlways
     The user authorized the app to start location services at any time.
     
     kCLAuthorizationStatusAuthorizedWhenInUse
     The user authorized the app to start location services while
     it is in use.
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
