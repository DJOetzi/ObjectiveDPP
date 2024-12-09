#import "include/Ping.h"

@implementation Ping : BaseCommand
    - (void) exec : (dpp::cluster&) ctx andSlashCommand : (const dpp::slashcommand_t&) cmd {
        cmd.reply("Objective Pong!");
    }
@end