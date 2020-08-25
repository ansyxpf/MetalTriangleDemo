//
//  ViewController.m
//  MetalTriangleDemo
//
//  Created by 徐鹏飞 on 2020/8/25.
//  Copyright © 2020 徐鹏飞. All rights reserved.
//

#import "ViewController.h"
//导入MetalKit 工具类
@import MetalKit;

#import "RenderObject.h"

@interface ViewController (){
    MTKView *_view;
    
    RenderObject *_renderer;
    
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Set the view to use the default device
    _view = (MTKView *)self.view;
    _view.device = MTLCreateSystemDefaultDevice();
    
    if(!_view.device)
    {
        NSLog(@"Metal is not supported on this device");
        return;
    }
    
    _renderer = [[RenderObject alloc] initWithMetalKitView:_view];
    
    if(!_renderer)
    {
        NSLog(@"Renderer failed initialization");
        return;
    }
    
    // Initialize our renderer with the view size
    [_renderer mtkView:_view drawableSizeWillChange:_view.drawableSize];
    
    _view.delegate = _renderer;

}


@end
