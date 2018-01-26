package com.android.foodgenix.Activity;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import com.android.foodgenix.Activity.R;
import com.facebook.FacebookSdk;
import com.google.android.gms.common.SignInButton;

public class LoginActivity extends AppCompatActivity {

    private EditText username,password;
    private Button login,toRegister;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        FacebookSdk.sdkInitialize(getApplicationContext());
        setContentView(R.layout.activity_login);

        SignInButton signInButton = (SignInButton) findViewById(R.id.loginGoogle);
        signInButton.setSize(SignInButton.SIZE_WIDE);

        username = (EditText) findViewById(R.id.edUsername);
        password = (EditText) findViewById(R.id.edPassword);
        login = (Button) findViewById(R.id.btnLogin);
        toRegister = (Button) findViewById(R.id.btnGoToSignUp);

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
