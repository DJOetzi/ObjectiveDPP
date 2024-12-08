#pragma once
#import <Foundation/Foundation.h>

#include <dpp/dpp.h>

@protocol DPPCommand
    - (void) exec : (dpp::cluster&) ctx andSlashCommand : (dpp::slashcommand_t&) cmd;
@end