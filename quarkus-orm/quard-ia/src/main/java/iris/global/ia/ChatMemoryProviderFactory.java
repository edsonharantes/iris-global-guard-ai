package iris.global.ia;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Supplier;

import dev.langchain4j.memory.ChatMemory;
import dev.langchain4j.memory.chat.ChatMemoryProvider;
import dev.langchain4j.memory.chat.MessageWindowChatMemory;

public class ChatMemoryProviderFactory implements Supplier<ChatMemoryProvider> {


    private static final Map<Object, ChatMemory> MEMORY =
            new ConcurrentHashMap<>();

    @Override
    public ChatMemoryProvider get() {
        return chatId ->
            MEMORY.computeIfAbsent(
                chatId,
                id -> MessageWindowChatMemory.withMaxMessages(20)
            );
    }

}