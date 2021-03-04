//
//  CoreLocationViewController.m
//  CoreLocation
//
//  Created by tigerfly on 2021/3/3.
//  Copyright © 2021 tigerfly. All rights reserved.
//

#import "CoreLocationViewController.h"

@interface CoreLocationViewController ()

@end

@implementation CoreLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
     Core Location
     
     Obtain the geographic location and orientation of a device.
     
     Core Location provides services that determine a device's
     geographic location, altitude, and orientation, or its
     position relation to a nearby iBeacon device. The framework
     gathers data using all available components on the device,
     including the Wi-Fi, GPS, Bluetooth, magnetometer, barometer,
     and cellular hardware.
     
     You use instances of the CLLocationManager class to configure,
     start, and stop the Core Location services. A location manager
     object supports the following location-related activities:
     
     •  Standard and significant location updates. Tracks large or
        small changes in the user's current location with a configurable
        degree of accuracy.
     •  Region monitoring. Monitor distinct regions of interest and
        generate location events when the user enters or leaves those
        regions.
     •  Beancon ranging. Detect and locate nearby beacons.
     •  Compass headings. Report heading changes from the onboard compass.
     
     To use location services, your app requests authorization and the
     system prompts the user to grant or deny the request.
     
     On iOS devices, users can change location service settings at any
     time in the Settings app, affecting individual apps or the device as
     a whole. Your app receives events, including authorization changes,
     in your location manager's delegate object, which conforms to the
     CLLocationManagerDelegate protocol.
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
