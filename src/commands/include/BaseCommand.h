#pragma once

#include <iostream>

#import <Foundation/Foundation.h>
#import "Protocols/DPPCommand.h"

@interface BaseCommand : NSObject<DPPCommand>
    // private properties
    {
        std::string description;
    }
    - (id) init     : (const std::string&) desc;
    - (void) exec   : (dpp::cluster&) ctx andSlashCommand : (dpp::slashcommand_t&) cmd;

    // region getters and setters
    - (const std::string&) getDescription;
    - (void)        setDescription : (const std::string&)desc;
    // endregion
@end