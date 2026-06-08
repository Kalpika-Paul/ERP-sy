<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    
    public function run(): void
    {
      
        User::create([
            'type' => 'admin',
            'name' => 'Emran',
            'phone' => '017XXXXXXXX',
            'branch' =>'EM Center',
            'email' => 'admin@easternmobile.com',
            'password' => Hash::make('1234567890'),
            'is_active' => 1,
            'email_verified_at' => now(),
        ]);
        
         User::create([
            'type' => 'admin',
            'name' => 'Jhini',
            'phone' => '017XXXXXXXX',
            'branch' =>'EM Center',
            'email' => 'adminm@easternmobile.com',
            'password' => Hash::make('12345'),
            'is_active' => 1,
            'email_verified_at' => now(),
        ]);

         User::create([
            'type' => 'admin',
            'name' => 'Abir',
            'phone' => '017XXXXXXXX',
            'branch' =>'EM Center',
            'email' => 'admind@easternmobile.com',
            'password' => Hash::make('654321'),
            'is_active' => 1,
            'email_verified_at' => now(),
        ]);

        User::create([
            'type' => 'admin',
            'name' => 'Nur Mohammad',
            'phone' => '018XXXXXXXX',
            'branch' =>'Jamuna Future Park',
            'email' => 'jfp01#sales@easternmobile.com',
            'password' => Hash::make('j1()34$$5'),
            'is_active' => 1,
            'email_verified_at' => now(),
        ]);

         User::create([
            'type' => 'Sales Person',
            'name' => 'Ahsan',
            'phone' => '018XXXXXXXX',
             'branch' =>'Jamuna Future Park',
            'email' => 'jfp02#sales@easternmobile.com',
            'password' => Hash::make('j2()98$$5'),
            'is_active' => 1,
            'email_verified_at' => now(),
        ]);
         User::create([
            'type' => 'Sales Person',
            'name' => 'Joy',
            'phone' => '018XXXXXXXX',
            'branch' =>'Bashundhara City Shopping Complex' ,
            'email' => 'bdcl01sales@easternmobile.com',
            'password' => Hash::make('b6(*)98##5'),
            'is_active' => 1,
            'email_verified_at' => now(),
        ]);
         User::create([
            'type' => 'Sales Person',
            'name' => 'Pappu',
            'phone' => '018XXXXXXXX',
             'branch' =>'Jamuna Future Park',
            'email' => 'bdcl02sales@easternmobile.com',
            'password' => Hash::make('b5(*)78##5'),
            'is_active' => 1,
            'email_verified_at' => now(),
        ]);
         User::create([
            'type' => 'Sales Person',
            'name' => 'Tanjid',
            'phone' => '018XXXXXXXX',
             'branch' =>'Eastern Plaza',
            'email' => 'ep01sales@easternmobile.com',
            'password' => Hash::make('e1(*)46**5'),
            'is_active' => 1,
            'email_verified_at' => now(),
        ]);
         User::create([
            'type' => 'Sales Person',
            'name' => 'Fida',
            'phone' => '018XXXXXXXX',
            'branch' =>'Eastern Plaza',
            'email' => 'ep02sales@easternmobile.com',
            'password' => Hash::make('e1(#)28**5'),
            'is_active' => 1,
            'email_verified_at' => now(),
        ]);
         
    }
}


