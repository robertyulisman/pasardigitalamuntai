import React from 'react';
import {View, Text} from 'react-native';
import Modal, {ModalContent, ScaleAnimation} from 'react-native-modals';

const CustomModal = ({onVisible, onClose, Content}) => {
  return (
    <View
      style={{
        position: 'absolute',
        flex: 1,
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
      }}>
      <Modal
        visible={onVisible}
        width={0.9}
        overlayOpacity={0.7}
        rounded
        useNativeDriver={true}
        actionsBordered
        swipeDirection={['down', 'up']}
        modalAnimation={new ScaleAnimation()}
        onSwipeOut={onClose}
        onTouchOutside={onClose}>
        <ModalContent>
          <View>{Content}</View>
        </ModalContent>
      </Modal>
    </View>
  );
};

export default CustomModal;
