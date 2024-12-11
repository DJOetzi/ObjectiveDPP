#import "include/Ping.h"

@implementation Ping : BaseCommand
    - (void) exec : (dpp::cluster&) ctx andSlashCommand : (const dpp::slashcommand_t&) cmd {
        float ws_ping = ctx.get_shard(0)->websocket_ping;

        /* Ping reply */
        cmd.reply(
                dpp::message().add_embed(
                        dpp::embed().
                                set_color(dpp::colors::yellow).
                                set_title("PONG!").
                                set_description(
                                std::format("Total Ping is: {0:.02f} ms", (ctx.rest_ping + ws_ping) * 1000)
                        )
                )
        );
    }
@end