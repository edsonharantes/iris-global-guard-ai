import { MessageSender } from './enums/message-sender.enum';    

export interface Message {
  id: string;
  content: string;
  sender: MessageSender;
  timestamp: Date;
}