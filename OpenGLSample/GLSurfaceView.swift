//
//  GLSurfaceView.swift
//  OpenGLSample
//
//  Created by Yamamoto Kensuke on 6/5/15.
//  Copyright (c) 2015 Yamamoto Kensuke. All rights reserved.
//

import Foundation
import UIKit
import OpenGLES

class GLSurfaceView: UIView {

    fileprivate var context: EAGLContext?
    fileprivate var viewFramebuffer = GLuint()
    fileprivate var viewRenderbuffer = GLuint()

    override class var layerClass : AnyClass {
        return CAEAGLLayer.self
    }

    override init (frame: CGRect) {
        
        super.init(frame: frame)
        
        let eaglLayer: CAEAGLLayer = self.layer as! CAEAGLLayer
        eaglLayer.isOpaque = true
        eaglLayer.drawableProperties = [
            kEAGLDrawablePropertyRetainedBacking: false,
            kEAGLDrawablePropertyColorFormat: kEAGLColorFormatRGBA8
            ] as NSDictionary as! [AnyHashable: Any]
        
        context = EAGLContext(api: EAGLRenderingAPI.openGLES1)
        EAGLContext.setCurrent(context)
        
        glGenFramebuffersOES(1, &viewFramebuffer)
        glBindFramebufferOES(GLenum(GL_FRAMEBUFFER_OES), viewFramebuffer)
        
        glGenRenderbuffersOES(1, &viewRenderbuffer)
        glBindRenderbufferOES(GLenum(GL_RENDERBUFFER_OES), viewRenderbuffer)

        glFramebufferRenderbufferOES(GLenum(GL_FRAMEBUFFER_OES), GLenum(GL_COLOR_ATTACHMENT0_OES), GLenum(GL_RENDERBUFFER_OES), viewRenderbuffer)
        
        self.context!.renderbufferStorage(Int(GL_RENDERBUFFER_OES), from:eaglLayer)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        let width = self.bounds.size.width
        let height = self.bounds.size.height

        glViewport(0, 0, GLsizei(width), GLsizei(height));
        
        self.render()
    }

    func render() {
        EAGLContext.setCurrent(context)
        glBindFramebufferOES(GLenum(GL_FRAMEBUFFER_OES), GLenum(viewFramebuffer))
        glClearColor(0.0, 0.0, 0.0, 0.0)
        glClear(GLenum(GL_COLOR_BUFFER_BIT))
        
        self.draw();
        
        glBindRenderbufferOES(GLenum(GL_RENDERBUFFER_OES), viewRenderbuffer)
        self.context?.presentRenderbuffer(Int(GL_RENDERBUFFER_OES))
    }
    
    func draw(){
        fatalError("This method must be overridden")
    }

}
