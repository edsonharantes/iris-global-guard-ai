import { Component, output  } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'global-watcher-chat-input',
  imports: [FormsModule],
  templateUrl: './global-watcher-chat-input.html',
  styleUrl: './global-watcher-chat-input.css',
})
export class GlobalWatcherChatInput {
  canSendMessage = true;
  readonly messageSentEvent = output<string>();

  sendMessage(input: HTMLInputElement) {    
    var message = input.value;
    input.value = ''; 

    if(message.trim() === '') {
      console.log("Cannot send empty message.");
      return; 
    }

    console.log("Message sent from input: "  + message);
   
    this.messageSentEvent.emit(message);
  }
}
