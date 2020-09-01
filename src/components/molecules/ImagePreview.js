import React, {Component} from 'react';
import {Text, View, Image, TouchableOpacity, Modal} from 'react-native';
import ReactNativeZoomableView from '@dudigital/react-native-zoomable-view/src/ReactNativeZoomableView';
import {Warna} from '../../../data';

const ImagePreview = ({onClose, visibleModal, ImageSource, title}) => {
  const logOutZoomState = (event, gestureState, zoomableViewEventObject) => {
    console.log('');
  };

  return (
    <Modal visible={visibleModal}>
      <View
        style={{
          flex: 1,
          backgroundColor: 'black',
        }}>
        <TouchableOpacity
          onPress={onClose}
          style={{marginTop: 20, alignSelf: 'flex-end', marginRight: 20}}>
          <Text style={{color: Warna.putih, fontSize: 22}}>X</Text>
        </TouchableOpacity>
        <ReactNativeZoomableView
          maxZoom={1.5}
          minZoom={0.5}
          zoomStep={0.5}
          initialZoom={1}
          bindToBorders={true}
          onZoomAfter={logOutZoomState}
          captureEvent={true}
          style={{
            padding: 10,
            backgroundColor: 'black',
          }}>
          <Image
            style={{flex: 1, width: null, height: '100%'}}
            source={ImageSource}
            resizeMode="contain"
          />
        </ReactNativeZoomableView>
        <Text
          style={{
            color: Warna.putih,
            alignSelf: 'center',
            bottom: 20,
            position: 'absolute',
            fontSize: 18,
          }}>
          {title}
        </Text>
      </View>
    </Modal>
  );
};

export default ImagePreview;
