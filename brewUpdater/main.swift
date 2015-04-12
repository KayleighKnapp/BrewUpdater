//
//  main.swift
//  brewUpdater
//
//  Created by Kayleigh Knapp on 4/6/15.
//  Copyright (c) 2015 Kayleigh Knapp. All rights reserved.
//

import Foundation

let updateCommand = "/usr/local/bin/brew update"
let doctorCommand = "/usr/local/bin/brew doctor > /var/tmp/doctormessage"
let success = "Your system is ready to brew.\n"

system(updateCommand)
system(doctorCommand)

let doctorMessage = String(contentsOfFile: "/var/tmp/doctormessage", encoding: NSUTF8StringEncoding, error: nil)

if let message = doctorMessage {
    if message != success {
        NSTask.launchedTaskWithLaunchPath("/usr/bin/osascript", arguments: ["-e", "display notification \"\(message)\" with title \"brew update issue\""])
    }
}
