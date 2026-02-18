import { DatePipe } from '@angular/common';
import { Component, input } from '@angular/core';
import { Message } from '@shared/models/message.model';
import { MessageSender } from '@shared/models/enums/message-sender.enum';

@Component({
  selector: 'global-watcher-chat-message',
  imports: [DatePipe],
  templateUrl: './global-watcher-chat-message.html',
  styleUrl: './global-watcher-chat-message.css',
})
export class GlobalWatcherChatMessage {
  readonly message = input<Message | null>();
  type_of_message = this.message()?.sender === MessageSender.Watcher ? 'left' : 'right';
  user = this.message()?.sender === MessageSender.Watcher ? 'Watcher' : 'User';
}
