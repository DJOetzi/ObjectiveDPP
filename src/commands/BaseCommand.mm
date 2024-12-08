#import "include/BaseCommand.h"

@implementation BaseCommand : NSObject
    - (id) init     : (const std::string&) desc {
        if ( self = [super init] ) {
            description = desc;
        }
        return self;
    }

    - (void) exec   : (dpp::cluster&) ctx andSlashCommand : (dpp::slashcommand_t&) cmd {
    }

    - (const std::string&) getDescription {
        return description;
    }
    - (void)        setDescription : (const std::string&)desc {
        description = desc;
    }
@end