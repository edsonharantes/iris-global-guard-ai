import { inject, Injectable } from '@angular/core';
import { Message } from './shared/models/message.model';
import { MessageSender } from '@shared/models/enums/message-sender.enum';
import { BehaviorSubject } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class ConversationService {

  private WholeConversation: Message[] = [];
  private http = inject(HttpClient);
  private list_of_messages = new BehaviorSubject<Message[]>([]);
  list_of_messages$ = this.list_of_messages.asObservable();

  addMessageToConversation(message: string, sender: MessageSender): Message {
    const messageObj: Message = {
      id: Math.random().toString(36).substring(2, 9),
      content: message,
      sender:sender,
      timestamp: new Date()
    };
    this.WholeConversation.push(messageObj);
    this.list_of_messages.next(this.WholeConversation);

    return messageObj;
  }

  addUserMessage(message: string): void {

    console.log("Adding user message to conversation service: " + message);
    this.sendUserMessage(this.addMessageToConversation(message, MessageSender.User));
  }

  addBotMessage(message: string): void {
    console.log("Adding bot message to conversation service: " + message);
    this.addMessageToConversation(message, MessageSender.Watcher);
  }

  sendUserMessage(message: Message): void {
    console.log("Sending user message to API: " + message);

    this.requestWatcherResponse(message);
  }

  requestWatcherResponse(userMessage: Message): void {
    
    this.addBotMessage("Resposta do bot... (esta é uma resposta fixa para teste, substitua pela resposta real da API)");
    // this.http.get("https://webhook.site/bdd9a6dd-f9ec-479a-83e0-940ed5050583", { responseType: 'text' }).subscribe(response => {
    //   console.log("Watcher response received:", response);
    //   // this.addMessageToConversation(response);
    // }, error => {
    //   console.error("Error fetching watcher response:", error);
    // });
  }
}
