package com.jcpdev.board.repository;
import org.springframework.stereotype.Repository;


import com.jcpdev.board.model.ChatRoom;

import javax.annotation.PostConstruct;
import java.util.*;
import java.util.stream.Stream;

@Repository
public class ChatRoomRepository {

    private Map<String, ChatRoom> chatRoomDTOMap;

    @PostConstruct
    private void init(){
        chatRoomDTOMap = new LinkedHashMap<>();
    }

    public List<ChatRoom> findAllRooms(){
        //채팅방 생성 순서 최근 순으로 반환
        List<ChatRoom> result = new ArrayList<>(chatRoomDTOMap.values());
        Collections.reverse(result);

        return result;
    }

    public ChatRoom findRoomById(String id){
    	System.out.println("id : "+id);
    	System.out.println(chatRoomDTOMap);
    	System.out.println("aasd"+chatRoomDTOMap.get(id));
        return chatRoomDTOMap.get(id);
    }

    public ChatRoom createChatRoomDTO(String name){
    	ChatRoom room = ChatRoom.create(name);
        chatRoomDTOMap.put(room.getRoomId(), room);
        return room;
    }
}