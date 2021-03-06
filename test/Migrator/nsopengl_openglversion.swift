// REQUIRES: objc_interop
// REQUIRES: OS=macosx
// RUN: %target-swift-frontend -typecheck -swift-version 3 %s
// RUN: rm -rf %t && mkdir -p %t && %target-swift-frontend -c -update-code -disable-migrator-fixits -primary-file %s -emit-migrated-file-path %t/nsopengl_openglversion.swift.result -o %t/nsopengl_openglversion.swift.remap -o /dev/null
// RUN: diff -u %S/nsopengl_openglversion.swift.expected %t/nsopengl_openglversion.swift.result
// RUN: %target-swift-frontend -typecheck -swift-version 4 %t/nsopengl_openglversion.swift.result

import AppKit

var major = GLint(0)
var minor = GLint(0)

NSOpenGLGetVersion(&major, &minor)
