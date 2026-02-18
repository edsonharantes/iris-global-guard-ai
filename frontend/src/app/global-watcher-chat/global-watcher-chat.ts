import { Component, ChangeDetectionStrategy, input } from '@angular/core';
import { GlobalWatcherChatMessage } from "../global-watcher-chat-message/global-watcher-chat-message";
import { AfterViewChecked, ElementRef, ViewChild } from '@angular/core';
import { AsyncPipe } from '@angular/common';
import { Message } from '@shared/models/message.model';

@Component({
  selector: 'global-watcher-chat',
  imports: [GlobalWatcherChatMessage],
  templateUrl: './global-watcher-chat.html',
  styleUrl: './global-watcher-chat.css',
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class GlobalWatcherChat {
  @ViewChild('container') chatContainer!: ElementRef;
  list_of_messages = input<Message[] | null>();

  ngOnInit() {
    console.log("list of messages in chat: " + this.list_of_messages);
  }
  scrollToBottom() {
    const el = this.chatContainer.nativeElement;
    el.scrollTop = el.scrollHeight;

    console.log("Scrolled to bottom of chat container");
  }
  private lastLength = 0;

  ngAfterViewChecked() {
    console.log("ngAfterViewChecked");
    if (this.list_of_messages()?.length !== this.lastLength) {
      this.lastLength = this.list_of_messages()?.length || 0;
      this.scrollToBottom();
    }


  }
}
