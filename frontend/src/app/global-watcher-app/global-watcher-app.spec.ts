import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GlobalWatcherApp } from './global-watcher-app';

describe('GlobalWatcherApp', () => {
  let component: GlobalWatcherApp;
  let fixture: ComponentFixture<GlobalWatcherApp>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [GlobalWatcherApp]
    })
    .compileComponents();

    fixture = TestBed.createComponent(GlobalWatcherApp);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
