

# Module 3: Working with native modules - homework

Our lottery app has impressed our Tech Lead, but to stay ahead, our CTO and Board suggest adding fresh features. This will make us stand out and improve the user experience.

Now, we're stepping into a new phase by creating special parts for both iOS and Android. Our Tech Lead is excited, knowing this can make our app even better. These parts, like new tools, will help the app do more things on each type of device.

Just as lotteries offer chances, our work on these parts gives us a chance to make our app extraordinary. By making these changes for iOS and Android, we're making sure our app can grow and get even better. This journey is big, and the results will be even bigger – let's start this exciting trip together.

### Homework management :house:

The final result of all homework is the React Native Application full of features implemented iteratively in the end phase of each module in the course. In order to keep consistency and track all of your changes we highly recommend you to create your own GitHub repository where your work as a participant will be stored. Your GitHub repository should be shared with all trainers, which will enable us to verify your work and communicate:

- John Fanidis - https://github.com/Doberjohn
- Filip Jarno - https://github.com/ziarno

Each module in the course will end up with homework consisting of a few tasks to fulfil. We would like to suggest a comfortable system for you to submit each task of the homework as a separate PR to the main branch in your repository. This will create a space for us to communicate with you, by doing code reviews - thanks to that we will be able to check your homework, discuss some uncertainties, or respond to questions you will leave in the PR. In case you have any trouble with homework you can always book a 1 to 1 session with the trainer, and also don't hesitate to ask your questions in the dedicated communication channel. Keep in mind that you don't have to worry about being blocked for the next homework, every homework will have a starting point, so you always will be able to override the content of your repository with the prepared starting point.


### **End goal of this homework**

In this homework, we will venture into the realm of native modules and components within React Native. These elements allow us to extend the capabilities of React Native apps by leveraging platform-specific features and creating custom UI components.

### Checkpoints 💡

The homework repository contains periodic checkpoints for your convenience. You will see callouts denoting the current checkpoint throughout this instruction. They will look something like this:


> 💡 You are now here → `checkpoint-xyz`

Feel free to check out the corresponding branch of any given checkpoint if you’re struggling or simply want to compare your solution with ours.

With that out of the way, let’s start!

## **Part 1 Create a native module for iOS**

Our goal is to construct a native module that enables notification display.

In the last part of this homework, we will display the notification to indicate that your lottery is created correctly.
This exercise involves several steps:

*Step 1*. Create ``Notification.swift`` and ``Notification.m`` files to support our module.

*Step 2*. Create a bridging header named ``myapp-Bridging-Header.h`` if not already present

*Step 3.* In this bridging header, import necessary React Native modules for integration.

*Step 4.* Implement the ``Notification`` class in Swift, annotated with ``@objc`` for compatibility with Objective-C. This class will handle notifications and interactions with JavaScript.

*Step 5.* Write the Objective-C counterpart of the `Notification` class in the ``Notification.m`` file, exporting methods to JavaScript.

*Step 6.* Register the notifications in the ``AppDelegate.m`` file to ensure notifications can be shown on iOS devices.

*Step 7.* Import the required statement inside ``AppDelegate.h`` and update the interface definition.

> 💡 You are now here → [Checkpoint 1](../../tree/checkpoint-1)


## **Part 2: Create na native component for iOS**

In this part, we're crafting a basic button component that can be utilized in React Native. In the last part of this homework, we will replace the "Register" button with a prepared native button. So a custom button should have properties like:

- title
- onPress
- disabled

*Step 1.* Establish `RNCustomButton.swift` to define the custom button class in Swift.

*Step 2.* Develop `RNCustomButtonViewManager.swift` to manage the custom button view. This Swift class should extend `RCTViewManager`.

*Step. 3.* Create `RNCustomButtonViewManager.m` to set up the bridge between Objective-C and Swift for our custom button.

*Step 4.* In bridging header, import necessary React Native modules for integration.

> 💡 You are now here → [Checkpoint 2](../../tree/checkpoint-2)


## **Part 3: Add native module for Android**

Similar to iOS platform, we want to have Notifications module working on Android platform.

*Step 1.* Create `NotificationPackage.kt` class that should extend ReactPackage class and override two methods - `createNativeModules` and `createViewManagers`. View manager should return empty list and native modules method should return list of modules into which we will add `NotificationModule`

*Step 2.* Create `NotificationModule.kt` class which should extend `ReactContextBaseJavaModule`. It should override `getName` function and implement notification logic

*Step 3.* Create Notification logic for the module. We should create notification channel that complies with Android requirements and then export `showNotification` method into JS world

*Step 4.* Register created package in `MainApplication.java`. Do this by adding `NotificationPackage` inside packages list returned from `getPackages` method

*Step 5.* Add Kotlin support to the project. Import kotlin plugin and add kotlin as dependency in `build.gradle` files. Also, remember to add Notification permissions to Android Manifest file

> 💡 You are now here → [Checkpoint 3](../../tree/checkpoint-3)


## **Part 4: Add native component for Android**

To create a native view, we need to create a CustomButton class that extends AppCompatButton and provide some additional features.

*Step 1.* Create a `CustomButton` Kotlin class that will extend `AppCompatButton`. Inside `init` call add logic that will handle onClick event by setting `setOnClickListener` callback

*Step 2.* Create `CustomButtonPackage` Kotlin class that extends `ReactPackage` and will override two methods - `createNativeModules` and `createViewManagers`. Since we're authoring native component we have to add `CustomButtonViewManager` to list iof returned packages

*Step 3.* Implement `CustomButtonViewManager`. It should extend `SimpleViewManager` class and override three of its methods - `getName`, `createViewInstance` and `getExportedCustomBubblingEventTypeConstants`. The last method should be responsible for mapping events with callback props (make sure event name matches the one that is used in native view class). This view manager should alse have two setters for react props that can be passed from JS world. We can use `@ReactProp` annotation here to set button properties

*Step 4.* Register created package in `MainApplication.java`. Do this by adding `CustomButtonPackage` inside packages list returned from `getPackages` method

> 💡 You are now here → [Checkpoint 4](../../tree/checkpoint-4)


## **Part 5: Use native module and native component in JavaScript**

Now that you've delved into creating native modules and components in the iOS environment, let's bridge the gap between the native and JavaScript worlds. This exercise focuses on how to harness the power of your newly crafted components and modules within your React Native app.

**Using the Notification Native Module:**

*Step 1*. Import the native module at the beginning of your JavaScript file:

```jsx
import { NativeModules } from 'react-native';

const { Notification } = NativeModules;

```

*Step 2*. Utilize the methods defined in the native module. For example, if your native module has a method named `showNotification`, you can call it like this:

```jsx
Notification.showNotification('Notification Title', 'Notification Body');
```

**Using the Custom Button Native Component:**

*Step 1.* Import the custom native component:

```jsx
import { requireNativeComponent } from 'react-native';

const CustomButton = requireNativeComponent('RNCustomButton');
```

*Step 2.* Integrate the custom button component into your JS :

```jsx
<CustomButton
	RNEnabledr={true}
	RNTitle="Click Me!"
	onPress={() => {
		console.log('Custom button pressed!');
	}}
	style={styles.customButton}
/>
```

> 💡 You are now here → [Checkpoint 5](../../tree/checkpoint-5)
