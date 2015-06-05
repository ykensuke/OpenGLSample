//
//  SampleTriangleView.swift
//  OpenGLSample
//
//  Created by Yamamoto Kensuke on 6/5/15.
//  Copyright (c) 2015 Yamamoto Kensuke. All rights reserved.
//

import Foundation
import OpenGLES

class TriangleView: GLSurfaceView{
    
    override func draw() {
        
        glColor4f(0.5, 0.5, 0.5, 1.0)
        
        var positions: [GLfloat] = [
        0.0,1.0,0.0,
        0.0,0.0,0.0,
        1.0,1.0,0.0,
        ];
        
        glEnableClientState(GLenum(GL_VERTEX_ARRAY))
        glVertexPointer(3,GLenum(GL_FLOAT), 0, positions)
        glDrawArrays(GLenum(GL_TRIANGLE_STRIP), 0, 3)
    }
    
}