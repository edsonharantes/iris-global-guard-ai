import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GlobalWatcherChat } from './global-watcher-chat';

describe('GlobalWatcherChat', () => {
  let component: GlobalWatcherChat;
  let fixture: ComponentFixture<GlobalWatcherChat>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [GlobalWatcherChat]
    })
    .compileComponents();

    fixture = TestBed.createComponent(GlobalWatcherChat);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
