import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GlobalWatcherChatInput } from './global-watcher-chat-input';

describe('GlobalWatcherChatInput', () => {
  let component: GlobalWatcherChatInput;
  let fixture: ComponentFixture<GlobalWatcherChatInput>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [GlobalWatcherChatInput]
    })
    .compileComponents();

    fixture = TestBed.createComponent(GlobalWatcherChatInput);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
