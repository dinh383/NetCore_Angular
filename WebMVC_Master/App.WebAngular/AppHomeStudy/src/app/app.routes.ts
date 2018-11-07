import { AuthGuard } from '@app/core/guards/auth.guard';
import { Routes } from '@angular/router';
import { MainComponent } from '@app/main/main.component';


export const appRoutes: Routes = [
    //localhost:4200
    { path: '', redirectTo: 'main', pathMatch: 'full' },
    //localhost:4200/login
    { path: 'login', loadChildren: './login/login.module#LoginModule' },
    //localhost:4200/main
    { path: 'main', loadChildren: './main/main.module#MainModule', canActivate: [AuthGuard] },
    {
        path: '**',
        redirectTo: 'error/404'
    }
]
