//
//  Globals.swift
//  iTunesSearchApp
//
//  Created by Erdem on 8.03.2022.
//

import UIKit

/**
 This file has includes global Properties.
*/

public var bounds       = UIScreen.main.bounds
public var boundsWidth  = bounds.width
public var boundsHeight = bounds.height

public let isSmallThan7Plus = UIScreen.main.nativeBounds.height <= 1334
public var textfieldHeigh   = bounds.height * (isSmallThan7Plus ? 0.085 : 0.07)
public var navbarHeigh      = bounds.height * 0.11
public var buttonHeigh      = bounds.height * 0.08
