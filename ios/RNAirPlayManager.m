#import "RNAirplayManager.h"
#import "RNAirplay.h"
#import <React/RCTBridge.h>
#import <React/UIView+React.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@implementation RNAirplayManager

RCT_EXPORT_MODULE();

@synthesize bridge = _bridge;

- (UIView *)view {
    MPVolumeView *volumeView = [[MPVolumeView alloc] init];

    for (UIView *wnd in volumeView.subviews) {
      if ([wnd isKindOfClass:[UIButton class]]) {
          UIButton *button = (UIButton*) wnd;
          UIImage *img = button.currentImage;
          UIImage *img2 = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
          [volumeView setRouteButtonImage: img2 forState:UIControlStateNormal];
          break;
      }
    }

    volumeView.tintColor = [UIColor colorWithRed: 0.69 green:0.41 blue:0.36 alpha:1.0];
    volumeView.showsVolumeSlider = false;

    return volumeView;
}
@end
