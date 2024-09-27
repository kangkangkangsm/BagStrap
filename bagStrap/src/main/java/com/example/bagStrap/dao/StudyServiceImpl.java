package com.example.bagStrap.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.bagStrap.mapper.StudyMapper;
import com.example.bagStrap.model.Item;
import com.example.bagStrap.model.StudyComm;

@Service
public class StudyServiceImpl implements StudyService{

	@Autowired
	StudyMapper studyMapper;
	// ------------------------------- 스터디 커뮤니티 --------------------------------------
	
	//스터디 커뮤니티 사이드 
	@Override
	public HashMap<String, Object> selectStuComm(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		
		try {
			List<StudyComm> boardTypelist = studyMapper.selectStuComm(map);
			List<StudyComm> boardList = studyMapper.selectStuCommList(map);
			resultMap.put("result", true);
			resultMap.put("message", "성공~");
			resultMap.put("boardTypelist", boardTypelist);
			resultMap.put("boardList", boardList);
			
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		
		return resultMap;
	}

	// 스터디 커뮤니티 컨텐츠 부문
	@Override
	public HashMap<String, Object> selectStuCommListBoard(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			List<StudyComm> commlist = studyMapper.selectStuCommListBoard(map);
			int countCommList = studyMapper.countCommList(map);
			resultMap.put("result", true);
			resultMap.put("message", "성공~");
			resultMap.put("commlist", commlist);
			resultMap.put("cnt", countCommList);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	// 스터디 커뮤니티 나의 댓글,게시글 목록 및 카운트
	public HashMap<String, Object> myCnt(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			int countMyCommList = studyMapper.countMyCommList(map);
			int countMycommentList = studyMapper.countMycommentList(map);
			List<StudyComm> selectMyComm = studyMapper.selectMyComm(map);
			List<StudyComm> selectMyComment = studyMapper.selectMyComment(map);
			List<StudyComm> selectStuGroupMyPage = studyMapper.selectStuGroupMyPage(map);
			resultMap.put("countMyCommCnt", countMyCommList);
			resultMap.put("countMycommentCnt", countMycommentList);
			resultMap.put("selectMyCommList", selectMyComm);
			resultMap.put("selectMyCommentList", selectMyComment);
			resultMap.put("selectStuGroupList", selectStuGroupMyPage);
			resultMap.put("result", true);
			resultMap.put("message", "성공~");
		
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	//스터디 커뮤니티 상세 글
	@Override
	public HashMap<String, Object> selectCommView(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			studyMapper.updateCommViews(map);
			StudyComm selectCommView = studyMapper.selectCommView(map);
			List<StudyComm> selectViewComment = studyMapper.selectViewComment(map);
			resultMap.put("result", true);
			resultMap.put("message", "성공~");
			resultMap.put("viewList", selectCommView);
			resultMap.put("viewComment", selectViewComment);
		
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	@Override
	public HashMap<String, Object> sidebarCnt(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			int countMyCommList = studyMapper.countMyCommList(map);
			int countMycommentList = studyMapper.countMycommentList(map);
			resultMap.put("countMyCommCnt", countMyCommList);
			resultMap.put("countMycommentCnt", countMycommentList);
			resultMap.put("result", true);
			resultMap.put("message", "성공~");
		
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	
	//스터디 커뮤니티 상세 글 - 댓글작성
	@Override
	public HashMap<String, Object> insertViewComment(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			studyMapper.insertViewComment(map);
			resultMap.put("idx",map.get("COMMENT_ID"));
			resultMap.put("result", true);
			resultMap.put("message", "댓글 작성 완료");
			System.out.println(resultMap);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	//스터디 커뮤니티 게시글 작성하기 카테고리  
	@Override
	public HashMap<String, Object> selectMyCommCategory(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			List<StudyComm> selectMyCommCategory = studyMapper.selectMyCommCategory(map);
			resultMap.put("categoryList", selectMyCommCategory);
			resultMap.put("result", true);
			resultMap.put("message", "댓글 작성 완료");
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	// 스터디 커뮤니티 게시글 작성
	@Override
	public HashMap<String, Object> insertComm(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			studyMapper.insertComm(map);
			resultMap.put("idx",map.get("board_Id"));
			resultMap.put("result", true);
			resultMap.put("message", "게시글 작성 완료");
			System.out.println(resultMap);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	// 스터디 커뮤니티 게시글 이미지 첨부
	@Override
	public HashMap<String, Object> addBoardFile(HashMap<String, Object> map) {
		studyMapper.insertBoardFile(map);
		return null;
	}
	// 스터디 커뮤니티 게시글 삭제 
	@Override
	public HashMap<String, Object> deleteBoard(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		try {
			studyMapper.deleteBoard(map);
			resultMap.put("result", true);
			resultMap.put("message", "게시글 삭제 완료");
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	//스터디 커뮤니티 게시글 숨기기 및 해제 
	@Override
	public HashMap<String, Object> updateStatusBoard(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		try {
			studyMapper.updateStatusBoard(map);
			resultMap.put("resultHide",map.get("BOARD_STATUS"));
			resultMap.put("result", true);
			resultMap.put("message", "ㅋㅋㅋ");
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	// 스터디 커뮤니티 업데이트
	@Override
	public HashMap<String, Object> updateComm(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			studyMapper.updateComm(map);
			resultMap.put("idx",map.get("board_Id"));
			resultMap.put("result", true);
			resultMap.put("message", "게시글 업데이트 완료");
			System.out.println(resultMap);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	// 스터디 커뮤티 게시글 댓글 숨기기
	@Override
	public HashMap<String, Object> updateStatusBoardComment(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			studyMapper.updateStatusBoardComment(map);
			System.out.println(map);
			resultMap.put("commentStatus",map.get("COMMENTSTATUS"));
			resultMap.put("result", true);
			resultMap.put("message", "게시글 업데이트 완료");
			System.out.println(resultMap);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	// 스터디 커뮤니티 게시글 댓글 삭제
	@Override
	public HashMap<String, Object> deleteBoardComment(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			studyMapper.deleteBoardComment(map);
			resultMap.put("result", true);
			resultMap.put("message", "댓글 삭제 완료");
			System.out.println(resultMap);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	// 스터디 커뮤티 게시글 좋아요
	@Override
	public HashMap<String, Object> insertCommLike(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			studyMapper.insertCommLike(map);
			System.out.println(map);
			resultMap.put("result", true);
			resultMap.put("message", "좋아요!");
			System.out.println(resultMap);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	// 스터디 커뮤니티 게시글 댓글 좋아요
	@Override
	public HashMap<String, Object> insertCommentLike(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			studyMapper.insertCommentLike(map);
			resultMap.put("result", true);
			resultMap.put("message", "좋아요!");
			System.out.println(resultMap);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	//스터디 커뮤니티 상세보기 좋아요 중복체크 
	@Override
	public HashMap<String, Object> selectLikeCheck(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			StudyComm selectLikeCheck = studyMapper.selectLikeCheck(map);
			resultMap.put("selectLikeCheck",selectLikeCheck);
			resultMap.put("result", true);
			resultMap.put("message", "전송완료");
			System.out.println(resultMap);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	// 스터디 커뮤니티 상세보기 좋아요 삭제
	@Override
	public HashMap<String, Object> deleteCommentLike(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			studyMapper.deleteCommentLike(map);
			resultMap.put("result", true);
			resultMap.put("message", "전송완료");
			System.out.println(resultMap);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	// 스터디 커뮤니티 좋아요수 갱신 
	@Override
	public HashMap<String, Object> selectgetLikeCount(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			StudyComm selectgetLikeCount = studyMapper.selectgetLikeCount(map);
			resultMap.put("result", true);
			resultMap.put("message", "조회완료");
			resultMap.put("likeCnt", selectgetLikeCount);
			System.out.println(resultMap);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	// 스터디 커뮤니티  댓글 수정모드
	@Override
	public HashMap<String, Object> updateComment(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			System.out.println("이거보면돼 --> " + map);

			studyMapper.updateComment(map);
			resultMap.put("result", true);
			resultMap.put("message", "조회완료");
			System.out.println(resultMap);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	// 스터디 커뮤니티  답글 수정모드 세트 바로위에거랑 같이 동작하는거임 일부러 같이 안넣음 
	@Override
	public HashMap<String, Object> updateCommentNO(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			studyMapper.updateCommentNO(map);
			resultMap.put("result", true);
			resultMap.put("message", "조회완료");
			System.out.println(resultMap);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	// 스터디 커뮤니티 수정완료처리
	@Override
	public HashMap<String, Object> updateCommentResult(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			studyMapper.updateCommentResult(map);
			resultMap.put("result", true);
			resultMap.put("message", "성고옹~");
			resultMap.put("idx",map.get("COMMENT_ID"));
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	// 스터디 커뮤니티 답글 세트
	@Override
	public HashMap<String, Object> updateCommentRENO(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			studyMapper.updateCommentRENO(map);
			resultMap.put("result", true);
			resultMap.put("message", "성고옹~");
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	// 스터디 커뮤니티 답글 모드
	@Override
	public HashMap<String, Object> updateCommentREY(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			studyMapper.updateCommentREY(map);
			resultMap.put("result", true);
			resultMap.put("message", "성고옹~");
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;

	}
	//스터디 커뮤니티 답글 마무뤼
	@Override
	public HashMap<String, Object> updateCommentReResult(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		try {
			studyMapper.updateCommentReResult(map);
			resultMap.put("result", true);
			resultMap.put("message", "답글 완");
			resultMap.put("idx",map.get("COMMENT_ID"));
			System.out.println(resultMap);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	// ------------------------------- 스터디 그룹 --------------------------------------
	//스터디 그룹 리스트(책 불러오기)
	@Override
	public HashMap<String, Object> selectStuGroupInsertBoardType(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		try {
			List<StudyComm> selectStuGroupInsertBoardType = studyMapper.selectStuGroupInsertBoardType(map);
			resultMap.put("result", true);
			resultMap.put("message", "완료");
			resultMap.put("typeList",selectStuGroupInsertBoardType);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	//스터디 그룹 만들기(책 불러오기)
	@Override
	public HashMap<String, Object> insertStuGroup(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		try {
			studyMapper.insertStuGroup(map);
			resultMap.put("idx",map.get("STUDY_GROUP_ID"));
			resultMap.put("result", true);
			resultMap.put("message", "그룹 개설 완료");
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	//스터디 그룹 리스트 
	@Override
	public HashMap<String, Object> selectStuGroupListSidebar(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		try {
			int cntlist= studyMapper.selectStuGroupListSidebarCnt(map);
			List<StudyComm> list = studyMapper.selectStuGroupListSidebar(map);
			resultMap.put("result", true);
			resultMap.put("message", "조회완료");
			resultMap.put("groupListCnt", cntlist);
			resultMap.put("groupList", list);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
		
	}
	//스터디 그룹 상세정보
	@Override
	public HashMap<String, Object> selectStuGroupDetail(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		try {
			StudyComm list = studyMapper.selectStuGroupDetail(map);
			resultMap.put("result", true);
			resultMap.put("message", "조회완료");
			resultMap.put("detailList", list);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	//스터디 신청하기 
	@Override
	public HashMap<String, Object> insertStuGroupApply(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			studyMapper.insertStuGroupApply(map);
			resultMap.put("result", true);
			resultMap.put("message", "신청완료 방장의 승인 후 가입되십니다.");
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	//스터디 중복신청
	@Override
	public HashMap<String, Object> selectStuGroupSubscription(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			StudyComm list = studyMapper.selectStuGroupSubscription(map);
			resultMap.put("result", true);
			resultMap.put("message", "중복된 신청임");
			resultMap.put("Subscription", list);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	//스터디 방장 자동가입
	@Override
	public HashMap<String, Object> insertStuGroupKingApply(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			studyMapper.insertStuGroupKingApply(map);
			resultMap.put("result", true);
			resultMap.put("message", "방장 자동가입");
			
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
}
	//스터디 사람검색
	@Override
	public HashMap<String, Object> selectStuGroupUserSearch(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		try {
			StudyComm adminlist = studyMapper.selectStuGroupUserSearch(map);
			StudyComm selectStuGroupUserApplSearch = studyMapper.selectStuGroupUserApplSearch(map);
			List<StudyComm> selectStuGroupSubscriptionSearch = studyMapper.selectStuGroupSubscriptionSearch(map);
			resultMap.put("adminlist", adminlist);
			resultMap.put("searchUserlist", selectStuGroupUserApplSearch);
			resultMap.put("searchjoinGroup", selectStuGroupSubscriptionSearch);
			resultMap.put("result", true);
			resultMap.put("message", "디테일 정보 검색");
			
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
	//마이페이지 -> 스터디그룹 수정
	@Override
	public HashMap<String, Object> updateStuGroup(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap();
		System.out.println(map);
		try {
			studyMapper.updateStuGroup(map);
			resultMap.put("idx",map.get("STUDY_GROUP_ID"));
			resultMap.put("result", true);
			resultMap.put("message", "그룹 수정 완료");
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			resultMap.put("result", false);
			resultMap.put("message", "에러가 발생했습니다. 에러 코드를 확인해주세요");
		}
		return resultMap;
	}
}
