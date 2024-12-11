#import "include/Info.h"

@implementation Info : BaseCommand
    - (void) exec : (dpp::cluster&) ctx andSlashCommand : (const dpp::slashcommand_t&) cmd {
        cmd.reply(
                dpp::message().add_embed(
                        dpp::embed().
                                set_color(dpp::colors::yellow).
                                set_title("My awesome D++ bot").
                                set_description("A real bot would have something witty here...").
                                add_field("Uptime", ctx.uptime().to_string(), true).
                                add_field("Users", std::to_string(dpp::get_user_count()), true).
                                add_field("Library Version", std::format("[{}]({})", dpp::utility::version(), "https://github.com/brainboxdotcc/DPP"), true)
                )
        );
    }
}
@end