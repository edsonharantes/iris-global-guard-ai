import { Component, output } from '@angular/core';
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

  sendMessage(input: HTMLTextAreaElement) {
    var message = input.value;
    input.value = '';

    if (message.trim() === '') {
      console.log("Cannot send empty message.");
      return;
    }




    console.log("Message sent from input: " + message);

    this.messageSentEvent.emit(message);
  }

  autoGrow(textarea: HTMLTextAreaElement) {
    const baseHeight = 36; // one-line height
    const maxHeight = 120;

    textarea.style.height = 'auto';

    const newHeight = Math.min(
      Math.max(textarea.scrollHeight, baseHeight),
      maxHeight
    );

    textarea.style.height = newHeight + 'px';
    textarea.style.overflowY =
      textarea.scrollHeight > maxHeight ? 'auto' : 'hidden';
  }

  onEnter(event: Event, textarea: HTMLTextAreaElement) {
    const keyboardEvent = event as KeyboardEvent;

    if (!keyboardEvent.shiftKey) {
      event.preventDefault();
      this.sendMessage(textarea);
      textarea.value = '';
      this.autoGrow(textarea);
    }
  }
}
