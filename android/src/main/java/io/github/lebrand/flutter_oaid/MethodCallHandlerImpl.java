package io.github.lebrand.flutter_oaid;

import android.app.Application;
import android.content.Context;
import android.text.TextUtils;

import androidx.annotation.NonNull;

import com.github.gzuliyujiang.oaid.DeviceID;
import com.github.gzuliyujiang.oaid.DeviceIdentifier;
import com.github.gzuliyujiang.oaid.IGetter;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MethodCallHandlerImpl implements MethodChannel.MethodCallHandler {

    private static final String methodRegister = "register";
    private static final String methodGetOaid = "getOaid";

    private Context mContext;

    public MethodCallHandlerImpl(Context context) {
        mContext = context;
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        if (methodGetOaid.equals(call.method)) {
            String oaid = DeviceID.getOAID();
            if (TextUtils.isEmpty(oaid)) {
                DeviceID.getOAID(mContext, new IGetter() {
                    @Override
                    public void onOAIDGetComplete(String text) {
                        result.success(text);
                    }

                    @Override
                    public void onOAIDGetError(Exception error) {
                        result.error("-1", "get oaid failed", error);
                    }
                });
            } else {
                result.success(oaid);
            }
        } else if (methodRegister.equals(call.method)) {
            DeviceIdentifier.register((Application) mContext.getApplicationContext());
            result.success(null);
        }
    }
}
