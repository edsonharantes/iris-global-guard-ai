package iris.global.resource;

import iris.global.ia.GlobalAiService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;

@Path("/ai/globals")
@ApplicationScoped
public class GlobalAiResource {
    @Inject
    GlobalAiService agent;

    @POST
    @Path("/ask/{chatId}")
    public String ask(
            @PathParam("chatId") String chatId,
            String ask
    ) {
        return agent.answer(chatId, ask);
    }
}
