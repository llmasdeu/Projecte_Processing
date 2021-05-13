#include "ofApp.h"

using namespace ofxCv;

void ofApp::setup() {
	ofSetVerticalSync(true);
	ofSetDrawBitmapMode(OF_BITMAPMODE_MODEL_BILLBOARD);

	cam.setup(640, 480);

	tracker.setup();
}

void ofApp::update() {
	cam.update();
	if(cam.isFrameNew()) {
		tracker.update(toCv(cam));
		position = tracker.getPosition();
		scale = tracker.getScale();
		orientation = tracker.getOrientation();
		rotationMatrix = tracker.getRotationMatrix();
	}
}

void ofApp::draw() {
	ofSetColor(255);
	cam.draw(0, 0);
	ofDrawBitmapString(ofToString((int) ofGetFrameRate()), 10, 20);

	if(tracker.getFound()) {
		ofSetLineWidth(1);
		tracker.draw();

		//easyCam.begin();
		ofSetupScreenOrtho(640, 480, -1000, 1000);
		ofTranslate(640 / 2, 480 / 2);
		applyMatrix(rotationMatrix);
		ofScale(5,5,5);
		ofDrawAxis(scale);
		tracker.getObjectMesh().drawWireframe();
		//easyCam.end();
	}
}


void ofApp::exit()
{
    tracker.stopThread();
    tracker.waitForThread();
}


void ofApp::keyPressed(int key) {
	if(key == 'r') {
		tracker.reset();
	}
}
