package com.android.foodgenix.Activity;

import android.app.DatePickerDialog;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.hbb20.CountryCodePicker;

import java.util.Calendar;

import es.dmoral.toasty.Toasty;

public class RegisterActivity extends AppCompatActivity {

    private Button btnGoToSignIn;
    private TextView birthdate;
    private DatePickerDialog.OnDateSetListener dataSetListener;
    private CountryCodePicker ccp;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);

        ccp = (CountryCodePicker) findViewById(R.id.ccp);
        birthdate = (TextView) findViewById(R.id.birthdate);
        btnGoToSignIn = (Button) findViewById(R.id.btnGoToSignIn);

        ccp.setOnCountryChangeListener(new CountryCodePicker.OnCountryChangeListener() {
            @Override
            public void onCountrySelected() {
                Toasty.warning(RegisterActivity.this, "Updated " + ccp.getSelectedCountryName(), Toast.LENGTH_LONG, true).show();
            }
        });

        birthdate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Calendar cal = Calendar.getInstance();
                int year = cal.get(Calendar.YEAR);
                int month = cal.get(Calendar.MONTH);
                int day = cal.get(Calendar.DAY_OF_MONTH);

                DatePickerDialog dialog = new DatePickerDialog(RegisterActivity.this, android.R.style.Theme_Holo_Light_Dialog_NoActionBar_MinWidth,dataSetListener,year,month,day);
                dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                dialog.show();
            }
        });

        dataSetListener = new DatePickerDialog.OnDateSetListener() {
            @Override
            public void onDateSet(DatePicker view, int year, int month, int dayOfMonth) {
                month += 1;
                birthdate.setText(dayOfMonth + "/" + month + "/" + year);
            }
        };


        btnGoToSignIn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }
}
