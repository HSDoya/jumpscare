 //적에게 당했을때 이벤트 출력코드
 public GameObject JumpscareCam; // 카메라(메인카메라 아님)
    public GameObject FPSCONTROLLER; // 플레이어 움직임 제어(false시 플레이어는 움직일수 없음)
    public bool JumpscareCamOn; // 카메라 온오프
    private void Start()
    {
        JumpscareCam.SetActive(false); 
        FPSCONTROLLER.SetActive(true);
    }
    private void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Player") // 태그가 플레이어면 
        { 
            FPSCONTROLLER.SetActive(false);
            JumpscareCamOn = true;
            if(JumpscareCamOn == true) // 카메라 온이 되면 
            {
                JumpscareCam.SetActive(true); // 이미지 출력 
                
            }
        }
    
    }
    //특정 트리거 발동시 이미지 출력 코드
    
     public GameObject JumpTrigger;
  public GameObject Ghost;

    void OnTriggerEnter()
    {
        StartCoroutine(ScaryArea());
    }

    IEnumerator ScaryArea()
    {
        
        Ghost.SetActive(true);
        yield return new WaitForSeconds(1); // You can set the delay to your liking // 시간 제어 
        JumpTrigger.SetActive(false); // Disables the trigger zone so the Player won't able to trigger it again while in game //
        Ghost.SetActive(false); // Disables the image after the timed delay //
        //Debug.Log("귀신등장"); // 트리거 발동 확인 
    }
