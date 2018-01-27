package com.android.foodgenix.Activity;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.android.foodgenix.Activity.R;
import com.facebook.CallbackManager;
import com.facebook.FacebookSdk;
import com.facebook.login.widget.LoginButton;
import com.google.android.gms.auth.api.Auth;
import com.google.android.gms.auth.api.signin.GoogleSignInResult;
import com.google.android.gms.common.SignInButton;
import com.google.android.gms.common.api.GoogleApiClient;

public class LoginActivity extends AppCompatActivity {

    private EditText edusername,edpassword;
    private Button login,toRegister;
    private TextView btnLoginGoogle;
    private LoginButton btnLoginFb;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        edusername = (EditText) findViewById(R.id.edUsername);
        edpassword = (EditText) findViewById(R.id.edPassword);
        login = (Button) findViewById(R.id.btnLogin);
        toRegister = (Button) findViewById(R.id.btnGoToSignUp);
        btnLoginGoogle = (TextView) findViewById(R.id.btnLoginGoogle);
        btnLoginGoogle.setTextSize(16);

        toRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent registerIntent = new Intent(LoginActivity.this,RegisterActivity.class);
                startActivity(registerIntent);
            }
        });

        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent mainIntent = new Intent(LoginActivity.this,MainActivity.class);
                finish();
                startActivity(mainIntent);
            }
        });


    }

}
