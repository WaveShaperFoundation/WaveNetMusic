use std::collections::{HashMap, VecDeque};

pub struct QueueService {
    // i32 -> User Identifier, Queue -> User's Queue
    pub queue: HashMap<i32,Queue>,
}

pub struct Queue {
    pub items: VecDeque<QueueItem>,
    pub current_song_id: i32,
    pub session_key: Option<String>,
}

pub struct QueueItem {
    pub song_id: i32,
    pub user_id: i32,
}

impl QueueService {

    pub fn new() -> QueueService {
        QueueService {
            queue: HashMap::new(),
        }
    }

    pub fn add_item(&mut self, user_id: i32, song_id: i32) {
        if !self.queue.contains_key(&user_id) {
            self.queue.insert(user_id, Queue::new());
        }
        self.queue.get_mut(&user_id).unwrap().add_item(song_id, user_id);
    }

}

impl Queue {

    pub fn new() -> Queue {
        Queue {
            items: VecDeque::new(),
            current_song_id: 0,
            session_key: None,
        }
    }

    pub fn add_item(&mut self, song_id: i32, user_id: i32) {
        self.items.push_back(QueueItem {
            song_id: song_id,
            user_id: user_id,
        });
    }

}