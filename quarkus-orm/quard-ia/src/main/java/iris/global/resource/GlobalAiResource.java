package iris.global.resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import iris.global.ia.GlobalAiService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;

@Path("/ai/globals")
@ApplicationScoped
public class GlobalAiResource {
    private static final Logger log = LoggerFactory.getLogger(GlobalAiResource.class);

    @Inject
    GlobalAiService agent;

    @POST
    @Path("/ask/{chatId}")
    public String ask(
            @PathParam("chatId") String chatId,
            String ask
    ) {
        try {
            return agent.answer(chatId, ask);
        } catch (Exception e) {
            log.error("GlobalAiResource-chat {}:{}", chatId, ask, e);
            return "An error occurred while processing your question. Please try again.";
        }
    }
}
