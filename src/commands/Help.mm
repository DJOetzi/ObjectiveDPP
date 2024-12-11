#import "include/Help.h"

@implementation Help : BaseCommand
    - (void) exec : (dpp::cluster&) ctx andSlashCommand : (const dpp::slashcommand_t&) cmd {
        auto parameter = cmd.get_parameter("term");

        /* Check to see if the parameter is provided by the user */
        if (std::holds_alternative<std::string>(parameter)) {

            /* If it is, get it and check what's in it */
            std::string search_term = std::get<std::string>(parameter);
            if (search_term == "ping") {
                cmd.reply("This help left useless as an exercise for the developer.");
            }
            else if (search_term == "info") {
                cmd.reply("This help left useless as an exercise for the developer. Again.");
            }
            else {
                /* Anything, something, so long as the bot replies. */
                cmd.reply("This message intentionally left blank. 🤪");
            }
        }
        else {
            /* Help reply */
            cmd.reply(
                    dpp::message().add_embed(
                            dpp::embed().
                                    set_color(dpp::colors::yellow).
                                    set_title("Help lol").
                                    set_description("Help goes here").
                                    add_field("/help", "This command, moron").
                                    add_field("/info", "See some info").
                                    add_field("/ping", "Pong?")
                    )
            );
        }
    }
@end