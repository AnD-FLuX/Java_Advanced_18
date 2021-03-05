package ua.lviv.lgs.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import ua.lviv.lgs.domain.Participant;
import ua.lviv.lgs.domain.ParticipantLevel;

@Repository
public class ParticipantRepo {

	private List<Participant> participants = new ArrayList<>();

	@PostConstruct
	public void init() {

		Participant participant1 = new Participant();
		participant1.setId(1);
		participant1.setName("Andrew");
		participant1.setEmail("Andrew@mail");
		participant1.setLevel(ParticipantLevel.L1);
		participant1.setPrimarySkill("Pro");

		Participant participant2 = new Participant();
		participant2.setId(2);
		participant2.setName("Max");
		participant2.setEmail("Max@mail");
		participant2.setLevel(ParticipantLevel.L2);
		participant2.setPrimarySkill("ProStreet");

		Participant participant3 = new Participant();
		participant3.setId(3);
		participant3.setName("Juli");
		participant3.setEmail("Juli@mail");
		participant3.setLevel(ParticipantLevel.L3);
		participant3.setPrimarySkill("Street");

		participants.add(participant1);
		participants.add(participant2);
		participants.add(participant3);
	}

	public List<Participant> findAllParticipants() {
		return participants;
	}

	public Participant findOne(Integer id) {
		return participants.stream().filter(part -> part.getId() == id).findFirst().orElse(null);
	}

	public void save(Participant participant) {
		Participant participantToUpdate = null;

		if (participant.getId() != null) {
			participantToUpdate = findOne(participant.getId());
			int participantIndex = participants.indexOf(participantToUpdate);

			participantToUpdate.setName(participant.getName());
			participantToUpdate.setEmail(participant.getEmail());
			participantToUpdate.setLevel(participant.getLevel());
			participantToUpdate.setPrimarySkill(participant.getPrimarySkill());
			participants.set(participantIndex, participantToUpdate);
		} else {
			// save
			if (participants.size() != 0) {
				participant.setId(participants.get(participants.size() - 1).getId() + 1);
			} else {
				participant.setId(1);
			}
			participants.add(participant);
		}
	}

	public void delete(Integer id) {
		Iterator<Participant> iter = participants.iterator();
		while (iter.hasNext()) {
			if (iter.next().getId() == id) {
				iter.remove();
			}
		}
	}

}