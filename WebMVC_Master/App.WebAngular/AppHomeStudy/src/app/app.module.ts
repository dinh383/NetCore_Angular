import { MainModule } from '@app/main/main.module';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule, CUSTOM_ELEMENTS_SCHEMA, ModuleWithProviders } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { RouterModule, PreloadAllModules } from '@angular/router';
import { AppComponent } from '@app/app.component';
import { appRoutes } from "@app/app.routes";

import {BrowserAnimationsModule, NoopAnimationsModule} from '@angular/platform-browser/animations';
import { AuthGuard } from '@app/core/guards/auth.guard';
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    HttpClientModule,
    BrowserAnimationsModule,
    NoopAnimationsModule,
    MainModule,
    RouterModule.forRoot(appRoutes, { useHash: true })
    //Routing
  ],
  providers: [AuthGuard],
  bootstrap: [AppComponent]
})
export class AppModule { }
