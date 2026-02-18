import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GlobalWatcherChatMessage } from './global-watcher-chat-message';

describe('GlobalWatcherChatMessage', () => {
  let component: GlobalWatcherChatMessage;
  let fixture: ComponentFixture<GlobalWatcherChatMessage>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [GlobalWatcherChatMessage]
    })
    .compileComponents();

    fixture = TestBed.createComponent(GlobalWatcherChatMessage);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
